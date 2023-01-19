# Hakyll Site Builder Action

This is a GitHub Action that allows you to build and deploy your static Hakyll
website automatically.

## Requirements

To use this Action, your website should be buildable using Stack. You should
use a resolver that includes Hakyll, so it is not defined as an `extra-deps`
dependency. The resolver will be overriden by this action.

## Usage

To use this Action, simply integrate it into a GitHub workflow in your Hakyll
site repositry. For example, you might create a file
`.github/workflows/publish.yaml` that looks like this:

```yaml
name: Deploy Hakyll website to GitHub Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Setup Pages
        uses: actions/configure-pages@v2
      - name: Build with Hakyll
        uses: stephenswat/hakyll-build-pages@main
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v1

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v1

```

## Credits

This repository borrows heavily from the official GitHub Action for building
Jekyll websites.
