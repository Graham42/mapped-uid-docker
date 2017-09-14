FROM ubuntu

RUN apt-get update && \
    apt-get install gosu && \
    rm -rf /var/lib/apt/lists/*

ADD make-tim.sh /

ENTRYPOINT ["/bin/sh", "/make-tim.sh"]
CMD ["/bin/bash"]
