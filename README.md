# wireguard-api
VPN node based in Wireguard with an API to get commands from master node

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/Release?label=Release)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/Publish%20Docker%20image?label=Docker%20image)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ragnarok22/wireguard-api/GitHub%20Package?label=GitHub%20Package)

## Usage
An easy way to communicate your wireguard server with your ui. Just make a post request to root route with de token key and the command. Example:

    curl --request POST http://wireguard_api -d 'token=my_token&command=my_command'
