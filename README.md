# Docs

Personal documentation built with [Hugo](https://gohugo.io) and the
[Book theme](https://github.com/alex-shpak/hugo-book) (v13).

## Setup

```bash
mise install                                   # hugo extended 0.169
git clone --depth 1 --branch v13 \
  https://github.com/alex-shpak/hugo-book.git themes/hugo-book
```

## Develop

```bash
hugo server            # http://localhost:1313, live reload
```

Write a page by dropping a Markdown file in `content/docs/<section>/<page>.md`.
Files need a `#` heading in the body (Book renders the page body only — the
front-matter `title` is used for the menu and `<title>`), and a `weight` to
control sidebar order. A folder becomes a sidebar group; give it an
`_index.md` for its title.

## Build

```bash
hugo --minify          # → public/
```

Publish `public/` anywhere static. Set the public URL first so links, sitemap
and feeds are absolute:

```bash
hugo --minify --baseURL https://docs.example.org/
```

or edit `baseURL` in `hugo.toml`.

## Structure

```
hugo.toml                         site + theme config
content/docs/_index.md            docs root
content/docs/maison/              one folder per domain → sidebar group
content/docs/maison/entretien.md
assets/css/custom.css             small fixes (task lists, checkboxes)
layouts/_partials/docs/inject/head.html   loads custom.css
layouts/index.html                / redirects to /docs/
themes/hugo-book/                 theme (gitignored)
```

Dark mode follows the OS (`BookTheme = "auto"`). Search is built at compile time
and runs client-side.
