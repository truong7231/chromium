FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# Cài Microsoft Edge và phụ thuộc
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list \
    && apt-get update \
    && apt-get install -y microsoft-edge-stable \
    python3 \
    python3-pip \
    xvfb \
    && pip3 install websockify \
    && apt-get clean
# Tạo file HTML cho giao diện web
RUN mkdir -p /app
COPY index.html /app/index.html
EXPOSE 3000
# Chạy Edge headless và proxy
CMD Xvfb :99 -screen 0 800x600x16 & \
    export DISPLAY=:99 && \
    microsoft-edge --headless --no-sandbox --disable-gpu --remote-debugging-port=9222 --window-size=800,600 & \
    python3 -m http.server 3000 --directory /app
