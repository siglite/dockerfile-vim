# dockerfile-vim

Building environment for latest vim.

## Howto

```console
$ git clone https://github.com/siglite/dockerfile-vim
$ docker build -t sig/vim:latest dockerfile-vim/ \
    --build-arg USER="$(id -un)" \
    --build-arg GROUP="$(id -gn)" \
    --build-arg uid="$(id -u)" \
    --build-arg gid="$(id -g)" \
    --build-arg HOME="/home/$(id -un)"
$ docker run -it --rm \
    -v "/path/to/repo/vim:/home/$(id -un)/vim" \
    -v "$HOME/local/stow:$HOME/local/stow" \
    sig/vim:latest
```

## Variables

- VERSION: You can select favorite vim version
- PREFIX: You can select install dir

### example

```console
$ docker run -it --rm \
    -e VERSION=v8.1.300
    -e PREFIX=/path/to/your_install_dir
    -v "$HOME/repo/vim:/home/$(id -un)/vim" \
    -v "/path/to:/path/to" \
    sig/vim:latest
```
