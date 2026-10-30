# syntax=docker/dockerfile:1

# Keep in sync with mise.toml (hugo-extended).
FROM ghcr.io/gohugoio/hugo:v0.169.0 AS build

USER root
WORKDIR /src

# The theme is cloned, not vendored. Bump the branch here to upgrade it.
RUN git clone --depth 1 --branch v13 \
      https://github.com/alex-shpak/hugo-book.git themes/hugo-book

COPY . .

# Must match the URL the site is served from: links, sitemap and feeds are absolute.
ARG BASE_URL=https://docs.xpander.ovh/
RUN hugo --minify --baseURL "${BASE_URL}" --cacheDir /tmp/hugo

FROM nginxinc/nginx-unprivileged:1.31-alpine

COPY --from=build /src/public /usr/share/nginx/html
