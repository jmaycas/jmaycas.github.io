---
layout: page
permalink: /research/
title: Research
description:
nav: true
nav_order: 3
---

<style>
  .paper-details {
    margin: 0.75rem 0 1.25rem 0;
    border-bottom: 1px solid var(--global-divider-color);
    padding-bottom: 1rem;
  }
  .paper-details summary {
    cursor: pointer;
    font-size: 1rem;
    font-weight: 500;
    line-height: 1.4;
    padding: 0.25rem 0;
    list-style: none;
  }
  .paper-details summary::-webkit-details-marker { display: none; }
  .paper-details summary::before {
    content: "▸ ";
    color: #4682B4;
    display: inline-block;
    margin-right: 0.35rem;
    transition: transform 0.15s ease;
  }
  .paper-details[open] summary::before {
    content: "▾ ";
    color: #4682B4;
  }
  .paper-details .available-request {
    color: var(--global-text-color-light);
    font-size: 0.85rem;
    font-style: italic;
    margin: 0.75rem 0 0.5rem 0;
  }
  .paper-details .abstract-text {
    text-align: justify;
    margin: 0.5rem 0 0.5rem 0;
  }
  .paper-details .presented-at {
    color: var(--global-text-color-light);
    font-size: 0.85rem;
    margin-top: 0.5rem;
  }
  .paper-details .paper-links {
    font-size: 0.85rem;
    font-style: italic;
    margin: 0.75rem 0 0.5rem 0;
  }
</style>

## Working papers

---

{% for paper in site.data.research %}
<details class="paper-details">
  <summary>
    {{ paper.title }}{% if paper.authors %}, with 
      {% for author in paper.authors %}<a href="{{ author.url }}" target="_blank">{{ author.name }}</a>{% if forloop.last == false %}, {% endif %}{% endfor %}
    {% endif %}
  </summary>

  {% if paper.available_upon_request %}
    <p class="available-request">[Available upon request]</p>
  {% endif %}

  {% if paper.link or paper.pdf %}
    <p class="paper-links">
      {% if paper.link %}<a href="{{ paper.link }}" target="_blank">Download PDF</a>{% endif %}
      {% if paper.pdf %}<a href="{{ paper.pdf }}" target="_blank">Download PDF</a>{% endif %}
    </p>
  {% endif %}

  {% if paper.abstract %}
    <p class="abstract-text">{{ paper.abstract }}</p>
  {% endif %}

  {% if paper.presented %}
    <p class="presented-at"><em>Presented at:</em> {{ paper.presented }}</p>
  {% endif %}
</details>
{% endfor %}

## Work in Progress

{% for project in site.data.work_in_progress %}
- **{{ project.title }}**{% if project.authors %}, with {% for author in project.authors %}<a href="{{ author.url }}" target="_blank">{{ author.name }}</a>{% if forloop.last == false %}, {% endif %}{% endfor %}{% endif %}{% if project.description and project.description != "" %}. <em>{{ project.description }}</em>{% endif %}
{% endfor %}