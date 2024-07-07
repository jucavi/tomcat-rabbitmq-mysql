#!/bin/bash

# Start RabbitMQ server in the background
rabbitmq-server &

# Wait for RabbitMQ server to start
sleep 10

# Enable required plugins
rabbitmq-plugins enable rabbitmq_management
rabbitmq-plugins enable rabbitmq_stomp
rabbitmq-plugins enable rabbitmq_web_stomp

# Create and configure the user
rabbitmqctl add_user snc snc123!
rabbitmqctl set_user_tags snc administrator
rabbitmqctl set_permissions -p / snc ".*" ".*" ".*"

# Wait to keep the container running
tail -f /dev/null
