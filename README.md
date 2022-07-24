# Elixir Portal

[![GitHub Pages](https://github.com/pfantato/elixir-portal/actions/workflows/main.yml/badge.svg)](https://github.com/pfantato/elixir-portal/actions/workflows/main.yml)

This is a small learning project to improve my knowledge in Elixir lang, and will be improved from time to time to practice my skills.

## How to setup the dev environment

You need to clone the repo and run mix deps.get to install the deps of the project.

```sh
git clone git@github.com:pfantato/elixir-portal.git
cd elixir-portal
mix deps.get
```

## Project documentation

Documentation are generated with [ExDoc](https://github.com/elixir-lang/ex_doc).

```sh
mix docs
```

## Actions

There is an [Action configured to build docs](.github/workflows/main.yml) on all pushes to `main` branch. It will generate the docs and push to `gh-pages` branch, which will trigger the Action to build [GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#choosing-a-publishing-source) and generate the [project docs](https://pfantato.github.io/elixir-portal) and publish it.
