# glibc

## Tag available
* latest, 2.23-r3, 2.23, 2 [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/glibc/Dockerfile)

## Description
What is [Glibc](https://www.gnu.org/software/libc/)?
Any Unix-like operating system needs a C library: the library which defines the system calls and other basic facilities such as open, malloc, printf, exit...  
The GNU C Library is used as the C library in the GNU system and in GNU/Linux systems, as well as many other systems that use Linux as the kernel.

## Build Image
```shell
docker build -t xataz/glibc:2.23 github.com/xataz/dockerfiles.git#master:glibc
```

## Usage
Use this image for build another image (example [mono](https://github.com/xataz/dockerfiles/tree/master/mono/))
```shell
FROM xataz/glibc:2.23
....
```
