FROM linuxserver/wireguard as wireguard_api

ENV API_TOKEN ${API_TOKEN}

RUN apt-get -y update
RUN apt-get install -y python3.6 python3-pip python-dev build-essential python3-venv

ADD . /
WORKDIR /

RUN pip3 install -r requirements.txt

CMD uvicorn api:app --host wireguard_api --port 8008;

EXPOSE 51820
EXPOSE 8008
