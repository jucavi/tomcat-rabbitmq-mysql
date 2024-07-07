FROM rabbitmq:3.8-management

# Copy the entrypoint script
COPY rabbitmq-init.sh /rabbitmq-init.sh
RUN chmod +x /rabbitmq-init.sh

# Expose the necessary ports
EXPOSE 5672 15672 15673 15674

# Set the entrypoint script
ENTRYPOINT ["/rabbitmq-init.sh"]
