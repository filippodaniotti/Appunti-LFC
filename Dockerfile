# FROM texlive/texlive:latest
FROM texlive/texlive@sha256:35df6f5eda3dba6420515c8cfd38cbe22b07ad417310edf0d8980460599a098c
#2020-11-13T23:00:23.019512792+01:00

ARG UNAME=user
ARG UID=1000
ARG GID=$UID

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
#Get dependencies
RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip install Pygments
RUN apt-get install ghostscript -y
RUN apt-get autoclean -y && apt-get autoremove -y

USER $UNAME
