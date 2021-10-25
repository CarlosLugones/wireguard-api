# wireguard-api

VPN node based in Wireguard with an API exposed to receive commands.

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/Release?label=Release)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/Publish%20Docker%20image?label=Docker%20image)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/GitHub%20Package?label=GitHub%20Package)

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Installation

Pull the image from GitHub Container Registery:

```bash
docker pull ghcr.io/lugodev/wireguard-api:main
```

Or from Docker Hub:

```bash
docker pull lugodev/wireguard-api
```

## Run the container

Run the container, providing the environment vars and the volume to store the VPN configurations:

```
docker run -d \
    --name=wireguard_api \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_MODULE \
    -e API_TOKEN=Your token \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Europe/London \
    -e SERVERURL=wireguard.domain.com `#optional` \
    -e SERVERPORT=51820 `#optional` \
    -e PEERS=1 `#optional` \
    -e PEERDNS=auto `#optional` \
    -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
    -e ALLOWEDIPS=0.0.0.0/0 `#optional` \
    -p 51820:51820/udp \
    -p 8008:8008 \
    -v /wireguard-api:/config \
    -v /lib/modules:/lib/modules \
    --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
    --restart unless-stopped \
    ghcr.io/lugodev/wireguard-api:main
```

The env vars:
* `API_TOKEN`: the token you pass to the API when sending commands via HTTP requests.
* `SERVERURL`: your VPN hostname.

The volume `/wireguard-api` holds the VPN configurations, map the folder you'd like in your folders structure.

## Ports exposed

The container exposes two ports, which must be allowed in your firewall in order to receive traffic.

* `51820`: WireGuard protocol.
* `8008`: WireGuard API.

Allow the ports:

```bash
ufw allow 51820
ufw allow 8008
ufw reload
```

## Usage

An easy way to communicate your WireGuard server with your UI. Just make a post request to root route with the token key and the command. Example:

```bash
curl --request POST http://wireguard_api -d 'token=my_token&command=my_command'
```

Examples:

```BASH
curl --request POST http://myvpn.com:8008/ -d 'token=my_token&command=wg set wg0 peer 6DVHXzbM0TfPr6Q4yDBtA/A0jzdUXu8XqR+yV2vF1F9= remove'
```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://lugodev.com"><img src="https://avatars.githubusercontent.com/u/18733370?v=4" width="100px;" alt=""/><br /><sub><b>Carlos Lugones</b></sub></a></td>
    <td align="center"><a href="https://blog.ragnarok22.dev"><img src="https://avatars.githubusercontent.com/u/8838803?v=4" width="100px;" alt=""/><br /><sub><b>Reinier Hernández</b></sub></a></td>
  </tr>
</table>
<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

<p align="center">
    <img src="http://ForTheBadge.com/images/badges/made-with-python.svg">
</p>
