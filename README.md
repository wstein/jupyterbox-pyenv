# Jupyter Container for pyenv and pipenv

I am preferring podman, but docker should also work fine. The start-container script maps the uid and the gid form container user to host user.

build image:

```bash
podman build --format=docker --tag quay.io/wstein/jupyter-pyenv .  
```

start container:

```bash
bin/start-container quay.io/wstein/jupyter-pyenv
```

now open the url: <http://127.0.0.1:8888/lab> or attach VS Code to the running container.
