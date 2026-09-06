FROM debian:stable-slim

COPY run.sh /run.sh

RUN apt update \
 && apt install -y python3 python3-dev python3-pip python3-setuptools python3-pkg-resources python3-hidapi python3-usb i2c-tools python3-smbus libusb-1.0-0 libusb-1.0-0-dev gcc make udev libudev-dev git --no-install-recommends \
 && python3 -m pip install -U git+https://github.com/liquidctl/liquidctl.git --break-system-packages \
 && apt remove --purge -y make gcc python3-dev libudev-dev libusb-1.0-0-dev python3-pip git \
 && apt autoremove -y \
 && chmod 0700 /run.sh \
 && rm -rf /var/lib/apt/lists/*

CMD ["/run.sh"]
