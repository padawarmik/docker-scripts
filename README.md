# Description
This repository contains some scripts which can be useful, especially during the setup of a new machine. 

The list of scripts is provided below:
* [zsh.sh](scripts/zsh/zsh.sh) - install zsh shell with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) on the machine and set up basic theme.

## Run as webserver

Those scripts can be provided thru a web server. You can use a prepared docker image.
To run a webserver with those scripts use provided [docker-compose.yml](docker-compose.yml) or use:
```bash
docker run -d -p 8000:80 --name sripts padawarm/scripts
```
<details>
    <summary><small>Supported architectures</small></summary>
    
    * linux/amd64
    * linux/arm64
    * linux/arm/v7
    * linux/arm/v6

</details>

When the container is up you can use  the following command to execute the script:
```bash
curl http://<ip_of_machine_with_container>:8000/zsh.sh | bash
```