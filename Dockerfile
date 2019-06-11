FROM ubuntu:latest
ENV THEOS /opt/theos
ENV PATH "$THEOS/bin:$PATH"
COPY setup.sh .
RUN ./setup.sh
