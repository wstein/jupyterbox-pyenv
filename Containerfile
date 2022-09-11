ARG BASEIMAGE=docker.io/jupyter/minimal-notebook
ARG VARIANT=latest

FROM ${BASEIMAGE}:${VARIANT}

ENV PIPENV_KEEP_OUTDATED=1
#ENV PIPENV_VENV_IN_PROJECT=1
ENV PIPENV_VERBOSITY=-1
ENV PYENV_ROOT=/opt/pyenv

USER root
# install python build dependecies (https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
RUN apt-get update &&\
    apt-get install --yes make build-essential libssl-dev \
    zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    wget curl llvm libncursesw5-dev xz-utils tk-dev \
    libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev &&\
    apt-get clean autoclean &&\
    apt-get autoremove --yes &&\
    rm -rf /var/lib/{apt,dpkg,cache,log}/

# install pyenv
RUN git clone --depth 1 https://github.com/pyenv/pyenv.git /opt/pyenv &&\
    git clone --depth 1 https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv &&\
    chown -R 1000:100 /opt/pyenv &&\
    ln -s /opt/pyenv/bin/pyenv /usr/local/bin/pyenv &&\
    /opt/pyenv/plugins/python-build/install.sh

# config sudo user
RUN sed -i -e 's/#%sudo.*/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers &&\
    usermod -aG sudo jovyan

USER jovyan
# user settings
RUN echo 'eval "$(pyenv init -)"' | tee -a /home/jovyan/.bashrc >> /home/jovyan/.zshrc &&\
    echo 'eval "$(pyenv virtualenv-init -)"' | tee -a /home/jovyan/.bashrc >> /home/jovyan/.zshrc

# install jupyter bash kernel
RUN pip install bash_kernel && python -m bash_kernel.install