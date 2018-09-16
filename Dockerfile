FROM debian:stretch

ENV DEPS \
  git gettext libtinfo-dev libacl1-dev libgpm-dev \
  perl libperl-dev \
  python3 python3-dev \
  ruby ruby-dev \
  lua5.2 liblua5.2-dev \
  cscope

RUN set -x && apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y $DEPS

ARG USER=develop
ARG GROUP=develop
ARG uid=1000
ARG gid=1000
ARG HOME=/home/${USER}

RUN groupadd -g ${gid} ${GROUP} && \
    useradd -u ${uid} -N -g ${GROUP} -m -d ${HOME} -s /bin/bash ${USER}

USER ${USER}
WORKDIR ${HOME}

COPY build.sh $HOME/

CMD ["./build.sh"]
