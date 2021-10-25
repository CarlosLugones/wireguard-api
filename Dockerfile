FROM linuxserver/wireguard as wireguard_api

ENV PUID 1000
ENV PGID 1000
ENV PEERDNS auto
ENV VPN_TIMEZONE ${VPN_TIMEZONE}
ENV SERVERURL ${VPN_HOSTNAME}
ENV SERVERPORT ${VPN_PORT}
ENV PEERS ${VPN_PEERS}
ENV API_PORT ${API_PORT}
ENV INTERNAL_SUBNET ${VPN_SUBNET}
ENV ALLOWEDIPS 0.0.0.0/0
ENV API_TOKEN ${API_TOKEN}

RUN apt-get -y update
RUN apt-get install -y python3.6 python3-pip python-dev build-essential python3-venv

ADD . /
WORKDIR /

RUN pip3 install -r requirements.txt

CMD uvicorn api:app --host wireguard_api --port ${API_PORT};

EXPOSE ${VPN_PORT}
EXPOSE ${API_PORT}
