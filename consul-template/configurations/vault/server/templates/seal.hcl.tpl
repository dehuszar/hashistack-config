seal "awskms" {
  access_key = "{{ env "AWS_ACCESS_KEY_ID" }}"
  secret_key = "{{ env "AWS_SECRET_ACCESS_KEY" }}"
  region     = "{{ env "AWS_REGION" }}"
  kms_key_id = "{{ env "VAULT_AWSKMS_SEAL_KEY_ID" }}"
}