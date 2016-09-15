# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "conntrack/map.jinja" import conntrack with context %}

conntrack_service__service:
  service.{{ conntrack.service.state }}:
    - name: {{ conntrack.service.name }}
{% if conntrack.service.state in [ 'running', 'dead' ] %}
    - enable: {{ conntrack.service.enable }}
{% endif %}

