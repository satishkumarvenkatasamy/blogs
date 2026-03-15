---
layout: default
title: Home
---

# Welcome to My Tech Blog

Thoughts and deep-dives on AI, Security, Identity & Access Management, and software engineering.

---

## AI

{% assign ai_pages = site.pages | where_exp: "page", "page.url contains '/ai/'" | where_exp: "page", "page.url != '/ai/'" | sort: "date" | reverse %}
{% if ai_pages.size > 0 %}
<ul>
  {% for post in ai_pages %}
    {% unless post.url contains 'index' %}
    <li>
      <a href="{{ post.url | relative_url }}"><strong>{{ post.title }}</strong></a>
      {% if post.date %}<span style="color: #888;"> — {{ post.date | date: "%B %d, %Y" }}</span>{% endif %}
      {% if post.tags %}<br><small>{{ post.tags | join: ", " }}</small>{% endif %}
    </li>
    {% endunless %}
  {% endfor %}
</ul>
{% else %}
<p>No posts yet.</p>
{% endif %}

[Browse all AI posts →]({{ "/ai/" | relative_url }})

---

## Security

{% assign sec_pages = site.pages | where_exp: "page", "page.url contains '/security/'" | where_exp: "page", "page.url != '/security/'" | sort: "date" | reverse %}
{% if sec_pages.size > 0 %}
<ul>
  {% for post in sec_pages %}
    {% unless post.url contains 'index' %}
    <li>
      <a href="{{ post.url | relative_url }}"><strong>{{ post.title }}</strong></a>
      {% if post.date %}<span style="color: #888;"> — {{ post.date | date: "%B %d, %Y" }}</span>{% endif %}
    </li>
    {% endunless %}
  {% endfor %}
</ul>
{% else %}
<p>Coming soon.</p>
{% endif %}

---

## IAM

{% assign iam_pages = site.pages | where_exp: "page", "page.url contains '/iam/'" | where_exp: "page", "page.url != '/iam/'" | sort: "date" | reverse %}
{% if iam_pages.size > 0 %}
<ul>
  {% for post in iam_pages %}
    {% unless post.url contains 'index' %}
    <li>
      <a href="{{ post.url | relative_url }}"><strong>{{ post.title }}</strong></a>
      {% if post.date %}<span style="color: #888;"> — {{ post.date | date: "%B %d, %Y" }}</span>{% endif %}
    </li>
    {% endunless %}
  {% endfor %}
</ul>
{% else %}
<p>Coming soon.</p>
{% endif %}
