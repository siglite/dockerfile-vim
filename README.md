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
    -e VERSION="YOUR_FAVORITE_VIM_VERSION" \
    -e PREFIX="YOUR_INSTALL_PATH" \
    -v "/path/to/repo/vim:/home/$(id -un)/vim" \
    -v "YOUR_INSTALL_PATH:YOUR_INSTALL_PATH" \
    sig/vim:latest
```
