FROM debian:stretch

ENV DEPS \
  git gettext libtinfo-dev libacl1-dev libgpm-dev \
  perl libperl-dev \
  python3 python3-dev \
  ruby ruby-dev \
  lua5.2 liblua5.2-dev \
  cscope

RUN set -x && apt-get update && apt-get install -y build-essential
RUN apt-get install -y $DEPS

CMD ["/bin/bash"]
