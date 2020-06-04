# shapez.io's Dockerfile
A Dockerfile to build Shapez.io

It aims to ease the build and deployment of a local version of [shapez.io](https://shapez.io)

__I know the image is huge right now (~2,54 Go), I wil fix it asap__

## shapez.io

[shapez.io](https://shapez.io) is an open source game created by 
[Tobias Springer](https://tobspr.com/).

You can find the source [here](https://github.com/tobspr/shapez.io) and you can
buy a standalone version of the game on [itch.io](https://tobspr.itch.io/shapezio)

## Build the docker image

```bash
git clone https://github.com/fistons/shapez.io-dockerfile.git
docker build --name shapez.io:latest .
```

## Play the game
```bash
docker run --name shapez.io -p 3005:3005 shapez.io:latest
```

Your favorite browser should open on the game page, otherwise, 
go [here](http://localhost:3005)
