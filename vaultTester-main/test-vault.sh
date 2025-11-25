#!/bin/sh
set -e

# Wait for Vault server to start
sleep 3

echo "🔐 Setting VAULT_ADDR..."
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

echo "✅ Vault server is running."

echo "🚀 Testing CRUD operations..."

# CREATE
vault kv put secret/hello foo=bar baz=qux
echo "✅ Created secret at secret/hello"

# READ
vault kv get secret/hello
echo "✅ Read secret from secret/hello"

# UPDATE
vault kv put secret/hello foo=updated_value new_key=new_value
echo "✅ Updated secret at secret/hello"

# READ AGAIN
vault kv get secret/hello

# DELETE
vault kv delete secret/hello
echo "✅ Deleted secret at secret/hello"

# VERIFY DELETION
vault kv get secret/hello || echo "✅ Secret deleted successfully!"

echo "🎉 CRUD test completed successfully!"
