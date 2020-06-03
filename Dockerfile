FROM node:10-stretch
LABEL maintainer="fistons"

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install ffmpeg git git-lfs autoconf automake gcc \
	&& git clone https://github.com/tobspr/shapez.io.git --dept 1

WORKDIR shapez.io/
RUN git lfs pull && yarn

WORKDIR gulp
RUN yarn

EXPOSE 3005

ENTRYPOINT ["yarn", "gulp"]