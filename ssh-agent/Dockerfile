FROM jenkins/ssh-agent:latest

# Получаем публичный ключ из переменной окружения и добавляем в authorized_keys
RUN echo "$JENKINS_AGENT_SSH_PUBKEY" > /home/jenkins/.ssh/authorized_keys && \
    chmod 600 /home/jenkins/.ssh/authorized_keys && \
    chown -R jenkins:jenkins /home/jenkins/.ssh