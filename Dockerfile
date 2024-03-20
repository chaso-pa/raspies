# From imported Raspi OS
FROM chasocpa/raspios:bookworm-arm64-lite

# Make ssh directory into root to enable ssh
WORKDIR /ssh

# ssh connection port
EXPOSE 22

USER pi
WORKDIR /home/pi

CMD ["bash"]
