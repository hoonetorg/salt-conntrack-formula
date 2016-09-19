# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - conntrack.install
  - conntrack.config
  - conntrack.service

extend:
  conntrack_config__conffile:
    file:
      - require:
        - pkg: conntrack_install__pkg
  conntrack_service__service:
    service:
      - watch:
        - file: conntrack_config__conffile
      - require:
        - pkg: conntrack_install__pkg
        - file: conntrack_install__file_primary_backup.sh_perms

