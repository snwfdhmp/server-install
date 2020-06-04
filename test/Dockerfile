FROM debian

RUN apt-get update && apt-get install -y wget

RUN echo "vpn-gateway" | sh -c "$(wget cooker.sh -O -)"