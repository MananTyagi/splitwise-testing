#!/bin/bash

# Install libpq-dev
sudo apt-get update
sudo apt-get install -y libpq-dev

# Run bundle install and other build commands
bundle install
# Add other build commands as needed
rails db:migrate