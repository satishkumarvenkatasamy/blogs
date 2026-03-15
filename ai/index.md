---
layout: default
title: AI
---

# AI — Artificial Intelligence

Deep-dives on Machine Learning, LLMs, Agentic AI, and the future of software.

---

{% assign ai_pages = site.pages | where_exp: "page", "page.url contains '/ai/'" | sort: "date" | reverse %}
<ul>
  {% for post in ai_pages %}
    {% unless post.url contains 'index' %}
    <li>
      <a href="{{ post.url | relative_url }}"><strong>{{ post.title }}</strong></a>
      {% if post.series %}<br><em>Series: {{ post.series }}{% if post.part %} — Part {{ post.part }}{% endif %}</em>{% endif %}
      {% if post.date %}<br><small>{{ post.date | date: "%B %d, %Y" }}</small>{% endif %}
      {% if post.tags %} &nbsp;·&nbsp; <small>{{ post.tags | join: " · " }}</small>{% endif %}
    </li>
    {% endunless %}
  {% endfor %}
</ul>
