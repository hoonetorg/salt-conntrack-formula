# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "conntrack/map.jinja" import conntrack with context %}

/tmp/conntrack.yaml:
  file.managed:
    - contents: |
        {{conntrack|yaml(False)|indent(8)}}
