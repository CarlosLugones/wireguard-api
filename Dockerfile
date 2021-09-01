FROM linuxserver/wireguard as lugodev_vpn_node

RUN apt-get -y update
RUN apt-get install -y python3.6 python3-pip python-dev build-essential python3-venv

RUN mkdir -p /codebase
ADD . /codebase
WORKDIR /codebase

RUN pip3 install -r requirements.txt

CMD uvicorn api:app --host lugodev_vpn_wireguard --port 8008;

EXPOSE 51820
EXPOSE 8008
