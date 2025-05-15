FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# Cài Chromium từ nguồn apt (không dùng Snap) và các phụ thuộc
RUN apt-get update && apt-get install -y \
    chromium-browser \
    chromium-chromedriver \
    python3 \
    python3-pip \
    xvfb \
    && pip3 install websockify \
    && apt-get clean
# Tạo thư mục cho giao diện web
RUN mkdir -p /app
# Tạo file HTML đơn giản để truy cập DevTools
COPY index.html /app/index.html
# Mở cổng 3000
EXPOSE 3000
# Chạy Xvfb, Chromium headless, và websockify
CMD Xvfb :99 -screen 0 800x600x16 & \
    export DISPLAY=:99 && \
    chromium-browser --headless --no-sandbox --disable-gpu --disable-extensions --remote-debugging-port=9222 --window-size=800,600 & \
    websockify 3000 localhost:9222
