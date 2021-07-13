[Unit]
Description=Bi-weekly-ish cert rotation timer

[Timer]
OnCalendar={{ or ( env "VAULT_SERVER_CERT_GEN_TIMER_ONCALENDAR" ) "*-01,15 00:00:00" }}
AccuracySec={{ or ( env "VAULT_SERVER_CERT_GEN_TIMER_ACCURACYSET" ) "12h" }}
Persistent={{ or ( env "VAULT_SERVER_CERT_GEN_TIMER_PERSISTENT" ) "true" }}
Unit=vault-server-cert-gen.service

[Install]
WantedBy=timers.target
