FROM alpine

RUN apk --no-cache add su-exec

ADD make-tim.sh /

ENTRYPOINT ["/bin/sh", "/make-tim.sh"]
CMD ["/bin/sh"]
