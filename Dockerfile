# From imported Raspi OS
FROM chasocpa/raspios:bookworm-arm64-lite

# Make ssh directory into boot to enable ssh
WORKDIR /boot/ssh

# Edit sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config && \
    sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir -p /var/run/sshd

# ssh connection port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
