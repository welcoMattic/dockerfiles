```shell
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 2812:2812 \
        xataz/monit
```
