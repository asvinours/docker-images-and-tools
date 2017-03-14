# Docker Tools Container

This image contains:
+ php7.1-cli
+ nodejs 7.7.2
+ composer
+ [phan](https://github.com/etsy/phan)

It also contains the following tools:
+ mediainfo
+ curl
+ git
+ zip
+ ssh

# Usage example

```bash
docker run --rm -it \
    -v $PWD:/var/www \
    -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -u $(id -u):$(id -g) \
    -e SSH_AUTH_SOCK \
    composer install
```

To cache known_hosts file you can add option `-v $PDW/.ssh:/home/user/.ssh` but make sure that .ssh directory 
exists before doing so.
