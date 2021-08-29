FROM alpine:3.14.2

RUN apk update
RUN apk add --no-cache abuild sudo
RUN adduser -D user
RUN addgroup user abuild
RUN adduser user wheel
RUN sed -e 's;^# \(%wheel.*NOPASSWD.*\);\1;g' -i /etc/sudoers

USER user
ENTRYPOINT ["/bin/sh"]
