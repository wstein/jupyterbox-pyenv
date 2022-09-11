# Use python-build Plugin to build local Python Version

## Build and install Python 3.9.13 to /usr/local 


```bash
sudo python-build 3.9.13 /usr/local
```

    Downloading Python-3.9.13.tar.xz...
    -> https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tar.xz
    Installing Python-3.9.13...
    Installed Python-3.9.13 to /usr/local
    


As this is not managed by pyenv, it is not listed in the versions list:


```bash
pyenv versions
```

      system
      3.10.7
      3.10.7/envs/demo1_py3.10.7
    * demo1_py3.10.7 (set by /home/jovyan/work/.python-version)


But it can be called directly:


```bash
/usr/local/bin/python3 --version
```

    Python 3.9.13

