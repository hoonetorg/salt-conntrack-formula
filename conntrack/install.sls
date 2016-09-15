# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "conntrack/map.jinja" import conntrack with context %}

conntrack_install__pkg:
  pkg.installed:
    - pkgs: {{ conntrack.pkgs }}
