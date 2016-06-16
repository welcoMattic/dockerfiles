# mono

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/mono/Dockerfile)

## Description
What is [Mono](http://www.mono-project.com)?
Sponsored by Microsoft, Mono is an open source implementation of Microsoft's .NET Framework based on the ECMA standards for C# and the Common Language Runtime. A growing family of solutions and an active and enthusiastic contributing community is helping position Mono to become the leading choice for development of cross platform applications.

## Build Image
```shell
docker build -t xataz/mono github.com/xataz/dockerfiles.git#master:mono
```

## Usage
Use this image for build another image (example [emby](https://github.com/xataz/dockerfiles/tree/master/emby/))
```shell
FROM xataz/mono
....
```
