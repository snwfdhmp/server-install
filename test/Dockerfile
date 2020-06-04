FROM debian

RUN apt-get update && apt-get install -y wget git

RUN printf "--dry-run -- vpn-gateway" | sh -c "$(wget https://raw.githubusercontent.com/snwfdhmp/server-install/master/get -O -)"

# COPY ./get .
# RUN ./get "vpn-gateway"