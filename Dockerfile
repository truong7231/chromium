FROM browserless/chrome:latest
ENV TOKEN="nvt2005S!"
ENV DEFAULT_LAUNCH_ARGS=["--no-sandbox", "--disable-gpu", "--window-size=800,600"]
EXPOSE 3000
CMD ["start"]
