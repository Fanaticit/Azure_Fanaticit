#!/bin/bash
if [ $BASH_SOURCE == $0 ]; then
  echo "USAGE: source ./scripts/auth.sh"
  #exit
fi

 STATE_PREFIX=${1:-$(echo "fan")}
# SECRET_NAME=$STATE_PREFIX"tfstate-access-key"

# export ARM_CLIENT_ID="2578e1b9-4743-4331-aaed-936a2432ddc9"
# export ARM_CLIENT_CERTIFICATE_PATH="$HOME/.certs/om-terraform.pfx"
# export ARM_CLIENT_CERTIFICATE_PASSWORD=$(openssl rand -base64 32)
# export ARM_TENANT_ID="c78e8ad4-d4e7-4c0d-94ef-1c17491b7cfa"

# rm -f ~/.certs/om-terraform.* >/dev/null 2>&1
# mkdir ~/.certs >/dev/null 2>&1

if [[ -z "${TF_IN_AUTOMATION}" ]]; then 
  az login --output table
fi
az account set --subscription "0259557f-b013-4d0c-ae55-0722baa1d258"
# export ARM_ACCESS_KEY="$(az keyvault secret show --name $SECRET_NAME --vault-name master-passwords-kv --query value --output json | sed -e 's/^\"//' -e 's/\"$//')"

# az keyvault secret download --vault-name master-passwords-kv --id https://master-passwords-kv.vault.azure.net/secrets/terraform-service-principal/56398b5c5f3c44f29205f778ab4bfbaa --file ~/.certs/om-terraform.tmp.pfx --encoding base64
# openssl pkcs12 -in ~/.certs/om-terraform.tmp.pfx -out ~/.certs/om-terraform.tmp.pem -passin pass:'' -nodes
# openssl pkcs12 -export -in ~/.certs/om-terraform.tmp.pem -out ~/.certs/om-terraform.pfx -passin pass:'' -nodes -passout pass:$ARM_CLIENT_CERTIFICATE_PASSWORD
# rm -f ~/.certs/om-terraform.tmp.*
# chmod 600 ~/.certs/om-terraform.pfx


##Old
#az login --tenant "c78e8ad4-d4e7-4c0d-94ef-1c17491b7cfa"