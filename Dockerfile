FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y chromium-browser python3 python3-pip xvfb && pip3 install websockify && apt-get clean
EXPOSE 3000
CMD Xvfb :99 -screen 0 800x600x16 & export DISPLAY=:99 && chromium-browser --headless --no-sandbox --disable-gpu --disable-extensions --remote-debugging-port=9222 --window-size=800,600 & websockify 3000 localhost:9222
