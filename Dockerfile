FROM ghcr.io/browserless/chromium:2.2.0
ENV TOKEN="your-secret-token"
ENV DEFAULT_LAUNCH_ARGS=["--no-sandbox","--disable-gpu","--window-size=800,600"]
ENV NODE_ENV=production
EXPOSE 3000
CMD ["start"]
