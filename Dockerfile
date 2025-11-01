# Use a lightweight official Vault image
FROM hashicorp/vault:latest

# Set environment variables for dev mode
ENV VAULT_ADDR=http://127.0.0.1:8200

# Copy in our test script
COPY test-vault.sh /usr/local/bin/test-vault.sh

# Make script executable
RUN chmod +x /usr/local/bin/test-vault.sh

# Run Vault in dev mode and execute our test script
CMD vault server -dev &
