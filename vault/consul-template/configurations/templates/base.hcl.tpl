api_addr      = "{{ env "VAULT_API_ADDR" }}"
cluster_addr  = "{{ env "VAULT_CLUSTER_ADDR" }}"
disable_mlock = {{ env "VAULT_DISABLE_MLOCK" }}
log_level     = "{{ env "VAULT_LOG_LEVEL" }}"
log_format    = "{{ env "VAULT_LOG_FORMAT" }}"
ui            = "{{ env "VAULT_UI" }}"