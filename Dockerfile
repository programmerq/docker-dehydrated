FROM python:2-alpine
RUN apk add --no-cache bash git openssl curl
RUN pip install dns-lexicon
ADD https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh lexicon.dehydrated.sh
RUN chmod +x lexicon.dehydrated.sh
RUN git clone https://github.com/lukas2511/dehydrated.git
WORKDIR /dehydrated
ENTRYPOINT ["/dehydrated/dehydrated"]
#RUN ln -sf /certs/domains.txt /domains.txt
