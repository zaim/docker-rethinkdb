# RethinkDB Dockerfile
# ====================
# Maintaned by Zaim Bakar <hi.zaimapps@gmail.com>


FROM ubuntu:12.04

# Update APT cache
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update -q
RUN apt-get upgrade -q -y

# Install python-software-properties
RUN apt-get install -q -y python-software-properties

# Add RethinkDB PPA repository
RUN add-apt-repository ppa:rethinkdb/ppa
RUN apt-get update -q

# Install RethinkDB
RUN apt-get install -q -y rethinkdb

# Expose ports
EXPOSE 8080 28015 29015

# Make /rethinkdb volume
VOLUME ["/rethinkdb"]

# Set entry point and default command args
ENTRYPOINT ["/usr/bin/rethinkdb"]
CMD ["--help"]
