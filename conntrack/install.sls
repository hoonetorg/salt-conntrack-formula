# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "conntrack/map.jinja" import conntrack with context %}

conntrack_install__pkg:
  pkg.installed:
    - pkgs: {{ conntrack.pkgs }}

#FIXME find a better way
conntrack_install__file_primary_backup.sh:
  cmd.run:
    - name: cp /usr/share/doc/conntrack*/doc/sync/primary-backup.sh /usr/libexec/keepalived/primary-backup.sh || cp /usr/share/doc/conntrackd/examples/sync/primary-backup.sh /usr/libexec/keepalived/primary-backup.sh
    - unless: diff /usr/share/doc/conntrack*/doc/sync/primary-backup.sh /usr/libexec/keepalived/primary-backup.sh || diff /usr/share/doc/conntrackd/examples/sync/primary-backup.sh /usr/libexec/keepalived/primary-backup.sh
    - require:
      - pkg: conntrack_install__pkg

conntrack_install__file_primary_backup.sh_perms:
  file.managed:
    - name: /usr/libexec/keepalived/primary-backup.sh
    - replace: False
    - user: root
    - group: root
    - mode: "0755"
    - require:
      - cmd: conntrack_install__file_primary_backup.sh
