# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "conntrack/map.jinja" import conntrack with context %}

conntrack_config__conffile:
  file.managed:
    - name: {{conntrack.confdir}}/{{ conntrack.conffile }}
    - source: salt://conntrack/files/conntrack.conf.jinja
    - template: jinja
    - context:
      confdict: {{conntrack|json}}
    - mode: 644
    - user: root
    - group: root
