FROM node:10-stretch AS build

RUN echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install ffmpeg git git-lfs autoconf automake gcc \
	&& git clone https://github.com/tobspr/shapez.io.git --depth 1

WORKDIR shapez.io/
RUN git lfs pull 
RUN yarn

# Ugliest hack ever, to enable js step in dev build.
# Probably should raise an issue upstream
RUN sed -i '237s/.*/"html.dev", "js.dev"/' gulp/gulpfile.js

WORKDIR gulp/
RUN yarn 
RUN yarn gulp build.dev

FROM nginx:alpine
LABEL maintainer="fistons"

COPY --from=build /shapez.io/build/ /usr/share/nginx/html