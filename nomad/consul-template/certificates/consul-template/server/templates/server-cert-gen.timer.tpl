[Unit]
Description=Bi-weekly-ish cert rotation timer

[Timer]
OnCalendar={{ or ( env "NOMAD_SERVER_CERT_GEN_TIMER_ONCALENDAR" ) "*-02,16 00:00:00" }}
AccuracySec={{ or ( env "NOMAD_SERVER_CERT_GEN_TIMER_ACCURACYSET" ) "12h" }}
Persistent={{ or ( env "NOMAD_SERVER_CERT_GEN_TIMER_PERSISTENT" ) "true" }}
Unit=nomad-server-cert-gen.service

[Install]
WantedBy=timers.target
