---
layout: default
title: Known Plugins
url: /bundler_known_plugins
previous: /bundler-compatibility
next: /faqs
---

{% for plugin in site.data.known_plugins %}
- [{{ plugin.name }}]({{ plugin.uri }}) - {{ plugin.summary }}
{% endfor %}
