# Start from official Vault image
FROM hashicorp/vault:latest

# Set environment variables
ENV VAULT_ADDR=http://127.0.0.1:8200
ENV VAULT_TOKEN=root

# Use sh as the entrypoint to run all commands inline
CMD sh -c '\
  echo "🚀 Starting Vault in dev mode..." && \
  vault server -dev -dev-root-token-id="$VAULT_TOKEN" & \
  sleep 5 && \
  echo "🔐 Vault server started. Beginning CRUD operations..." && \
  \
  echo "\n👉 CREATE secret..." && \
  vault kv put secret/hello foo=bar baz=qux && \
  \
  echo "\n👉 READ secret..." && \
  vault kv get secret/hello && \
  \
  echo "\n👉 UPDATE secret..." && \
  vault kv put secret/hello foo=updated_value new_key=new_value && \
  \
  echo "\n👉 READ updated secret..." && \
  vault kv get secret/hello && \
  \
  echo "\n👉 DELETE secret..." && \
  vault kv delete secret/hello && \
  \
  echo "\n👉 VERIFY deletion..." && \
  vault kv get secret/hello || echo "✅ Secret deleted successfully!" && \
  \
  echo "\n🎉 CRUD test completed successfully!" && \
  sleep 2'

# # Use a lightweight official Vault image
# FROM hashicorp/vault:latest

# # Set environment variables for dev mode
# ENV VAULT_ADDR=http://127.0.0.1:8200

# # Copy in our test script
# COPY test-vault.sh /usr/local/bin/test-vault.sh

# # Make script executable
# RUN chmod +x /usr/local/bin/test-vault.sh

# # Run Vault in dev mode and execute our test script
# CMD vault server -dev &
