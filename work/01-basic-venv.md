# PyEnv session

## Install new Python 3.10.7

currently there is only the package manager version of Python installed, called **system**:


```bash
pyenv versions
```

    * system (set by /opt/pyenv/version)



```bash
pyenv install 3.10.7
```

    Downloading Python-3.10.7.tar.xz...
    -> https://www.python.org/ftp/python/3.10.7/Python-3.10.7.tar.xz
    Installing Python-3.10.7...
    Installed Python-3.10.7 to /opt/pyenv/versions/3.10.7
    


## Create new Virtual Environment 

Create virtual environment demo1_py3.10.7:


```bash
pyenv virtualenv 3.10.7 demo1_py3.10.7
```

list virtual environments:


```bash
pyenv virtualenvs
```

      3.10.7/envs/demo1_py3.10.7 (created from /opt/pyenv/versions/3.10.7)
      demo1_py3.10.7 (created from /opt/pyenv/versions/3.10.7)


### Activate new Python Virtual Environment for local Folder/Project


```bash
pyenv local demo1_py3.10.7
```

Check active Python Virtual Environment for local Folder/Project:


```bash
pyenv version
```

    demo1_py3.10.7 (set by /home/jovyan/work/.python-version)


Jupyter workaround, explicit set env VIRTUAL_ENV:


```bash
export VIRTUAL_ENV=$(pyenv virtualenv-prefix)/envs/$(pyenv version-name)
```

### Install pipenv Package

install pipenv package into local environment:


```bash
pyenv exec pip install pipenv
```

    Collecting pipenv
      Using cached pipenv-2022.9.8-py2.py3-none-any.whl (3.3 MB)
    Collecting virtualenv-clone>=0.2.5
      Using cached virtualenv_clone-0.5.7-py3-none-any.whl (6.6 kB)
    Collecting certifi
      Using cached certifi-2022.6.15.1-py3-none-any.whl (160 kB)
    Collecting virtualenv
      Using cached virtualenv-20.16.5-py3-none-any.whl (8.8 MB)
    Requirement already satisfied: setuptools>=36.2.1 in /opt/pyenv/versions/3.10.7/envs/demo1_py3.10.7/lib/python3.10/site-packages (from pipenv) (63.2.0)
    Collecting filelock<4,>=3.4.1
      Using cached filelock-3.8.0-py3-none-any.whl (10 kB)
    Collecting platformdirs<3,>=2.4
      Using cached platformdirs-2.5.2-py3-none-any.whl (14 kB)
    Collecting distlib<1,>=0.3.5
      Using cached distlib-0.3.6-py2.py3-none-any.whl (468 kB)
    Installing collected packages: distlib, virtualenv-clone, platformdirs, filelock, certifi, virtualenv, pipenv
    Successfully installed certifi-2022.6.15.1 distlib-0.3.6 filelock-3.8.0 pipenv-2022.9.8 platformdirs-2.5.2 virtualenv-20.16.5 virtualenv-clone-0.5.7



```bash
pyenv exec pip list
```

    Package          Version
    ---------------- -----------
    certifi          2022.6.15.1
    distlib          0.3.6
    filelock         3.8.0
    pip              22.2.2
    pipenv           2022.9.8
    platformdirs     2.5.2
    setuptools       63.2.0
    virtualenv       20.16.5
    virtualenv-clone 0.5.7



```bash
pyenv exec pip list --not-required
```

    Package Version
    ------- --------
    pip     22.2.2
    pipenv  2022.9.8


## Install Packages with pipenv

### Install all Packages from Pipfile.lock (sync):


```bash
pipenv sync
```

    [1mInstalling dependencies from Pipfile.lock (25c40d)...[0m
    To activate this project's virtualenv, run [33mpipenv shell[0m.
    Alternatively, run a command inside the virtualenv with [33mpipenv run[0m.
    [32mAll dependencies are now up-to-date![0m
    [0m

List install packages:


```bash
pyenv exec pip list
```

    Package            Version
    ------------------ -----------
    certifi            2022.6.15.1
    charset-normalizer 2.1.1
    distlib            0.3.6
    filelock           3.8.0
    idna               3.3
    pip                22.2.2
    pipenv             2022.9.8
    platformdirs       2.5.2
    requests           2.28.1
    setuptools         63.2.0
    urllib3            1.26.9
    virtualenv         20.16.5
    virtualenv-clone   0.5.7



```bash
pyenv exec pip list --not-required
```

    Package  Version
    -------- --------
    pip      22.2.2
    pipenv   2022.9.8
    requests 2.28.1


### Install additional Package numpy:


```bash
pyenv exec pipenv install --keep-outdated numpy
```

    [32m[1mInstalling numpy...[0m
    [K[1mAdding[0m [32m[1mnumpy[0m [1mto Pipfile's[0m [33m[1m[packages][0m[1m...[0m
    [K[?25h✔ Installation Succeeded[0m 
    [1mInstalling dependencies from Pipfile.lock (25c40d)...[0m
    To activate this project's virtualenv, run [33mpipenv shell[0m.
    Alternatively, run a command inside the virtualenv with [33mpipenv run[0m.
    [0m

Recreate Pipfile.lock:


```bash
pyenv exec pipenv lock
```

    Locking[0m [33m[packages][0m dependencies...[0m
    [K[KBuilding requirements...
    [KResolving dependencies...
    [K[?25h[32m[22m✔ Success![39m[22m[0m 
    Locking[0m [33m[dev-packages][0m dependencies...[0m
    [1mUpdated Pipfile.lock (25c40d)![0m
    [0m

List install packages:


```bash
pyenv exec pip list
```

    Package            Version
    ------------------ -----------
    certifi            2022.6.15.1
    charset-normalizer 2.1.1
    distlib            0.3.6
    filelock           3.8.0
    idna               3.3
    numpy              1.23.3
    pip                22.2.2
    pipenv             2022.9.8
    platformdirs       2.5.2
    requests           2.28.1
    setuptools         63.2.0
    urllib3            1.26.9
    virtualenv         20.16.5
    virtualenv-clone   0.5.7



```bash
pyenv exec pip list --not-required
```

    Package  Version
    -------- --------
    numpy    1.23.3
    pip      22.2.2
    pipenv   2022.9.8
    requests 2.28.1


### Delete Virtual Environment demo1_py3.10.7

Unset local python version:


```bash
pyenv local --unset
```

Remove the specified virtualenv without prompting for confirmation:


```bash
pyenv virtualenv-delete -f demo1_py3.10.7
```

List remaining Python versions:


```bash
pyenv versions
```

    * system (set by /opt/pyenv/version)
      3.10.7

