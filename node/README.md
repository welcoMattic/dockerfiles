![](https://i.goopics.net/lq.png)

## ImageLayer
* 4.4.0 [![](https://badge.imagelayers.io/xataz/node:4.svg)](https://imagelayers.io/?images=xataz/node:4 'Get your own badge on imagelayers.io')
* 4.4.0-onbuild [![](https://badge.imagelayers.io/xataz/node:4-onbuild.svg)](https://imagelayers.io/?images=xataz/node:4-onbuild 'Get your own badge on imagelayers.io')
* 5.8.0 [![](https://badge.imagelayers.io/xataz/node:5.svg)](https://imagelayers.io/?images=xataz/node:5 'Get your own badge on imagelayers.io')
* 5.8.0-onbuild [![](https://badge.imagelayers.io/xataz/node:5-onbuild.svg)](https://imagelayers.io/?images=xataz/node:5-onbuild 'Get your own badge on imagelayers.io')

## Tag available
* latest, 5.8.0, 5.7, 5 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/5.7.0/Dockerfile)
* latest-onbuild, 5.8.0-onbuild, 5.7-onbuild, 5-onbuild, onbuild [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/5.7.0-onbuild/Dockerfile)
* lts, 4.4.0, 4.3, 4 [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/4.3.0/Dockerfile)
* lts-onbuild, 4.4.0-onbuild, 4.3-onbuild, 4-onbuild [(Dockerfile)](https://github.com/xataz/dockerfiles/blob/master/node/4.3.0-onbuild/Dockerfile)

## Description
What is Node.js?

Node.js is a software platform for scalable server-side and networking applications. Node.js applications are written in JavaScript and can be run within the Node.js runtime on Mac OS X, Windows, and Linux without changes.

Node.js applications are designed to maximize throughput and efficiency, using non-blocking I/O and asynchronous events. Node.js applications run single-threaded, although Node.js uses multiple threads for file and network events. Node.js is commonly used for real-time applications due to its asynchronous nature.

Node.js internally uses the Google V8 JavaScript engine to execute code; a large percentage of the basic modules are written in JavaScript. Node.js contains a built-in, asynchronous I/O library for file, socket, and HTTP communication. The HTTP and socket support allows Node.js to act as a web server without additional software such as Apache.

## Build Image

```shell
docker build -t xataz/node:5.8.0 github.com/xataz/dockerfiles.git#master:node/5.7.0
```


## Autobuild specification
This is an autobuild image, but for this autobuild works, I added the compilation directive --without-snapshot.
You can build this image without this directive, it works on my computer.

## Usage
### Simple run
```
docker run -d -v $(pwd):/usr/app/src -w /usr/app/src xataz/node:5.8.0 node app.js
```

### With onbuild
Create a Dockerfile on your project :
```
FROM xataz/node:5.8.0-onbuild

```

And build this :
```
docker build -t myproject .
```

Exemple image integration [here](https://github.com/mondediefr/mondedie-chat/blob/master/Dockerfile)
