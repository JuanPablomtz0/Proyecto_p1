FROM debian:latest
COPY ./app.sh /
ENTRYPOINT ["/app.sh"]
