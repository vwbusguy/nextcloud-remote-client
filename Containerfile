FROM docker.io/python:3-alpine

MAINTAINER Scott A. Williams <vwfoxguru@gmail.com>

WORKDIR /usr/src

COPY . .

RUN pip install -r requirements.txt

RUN ln -s /usr/src/nrc /usr/bin/nrc

ENTRYPOINT ["/usr/src/nrc"]
