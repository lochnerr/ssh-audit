FROM alpine:latest

LABEL MAINTAINER Richard Lochner, Clone Research Corp. <lochner@clone1.com> \
      org.label-schema.name = "ssh-audit" \
      org.label-schema.description = "Minimal ssh-audit container suitable for use with a Samba 4 Active Director Domain Controller." \
      org.label-schema.vendor = "Clone Research Corp" \
      org.label-schema.usage = "https://github.com/lochnerr/ssh-audit" \
      org.label-schema.url = "https://certbot.eff.org/about/" \
      org.label-schema.vcs-url = "https://github.com/lochnerr/ssh-audit.git"

# A minimal wrapper container for ssh-audit.
#
# Volumes:
#  * None
#
# Exposed ports:
#  * None
#
# Linux capabilities required:
#  * None

# Add packages.
RUN apk add --update --no-cache git python3

RUN git clone https://github.com/jtesta/ssh-audit.git

# Copy the local scripts.
COPY bin/* /usr/local/bin/

# Run the daemon in the foreground.
ENTRYPOINT ["/usr/local/bin/do-scan.sh"]

