sudo cp daemon.json /etc/docker/daemon.json
sudo apt-get update && apt-get upgrade -y
curl -s https://get.docker.com/ | sudo sh
docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
docker run -d -p 2236:8989 --restart=always h.zmlzml.top:55000/ssr -s 0.0.0.0 -p 8989 -k qq123456 -m chacha20 -o http_simple -O auth_sha1_v4 -g baidu.com



