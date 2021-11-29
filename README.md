# marp-action

## Description

Publish your [Marp Presentation](https://marp.app/) to GitHub Pages automatically using a GitHub Action.

## 🚀 Getting Started

Read through the [setup instructions](https://alexsci.com/test-marp-action/) to learn the process. You'll be using this [template repo](https://github.com/ralexander-phi/test-marp-action) as your starting point.

## 🔧 Configuration

The Action can be configured using environment variables:

| Variable | Required | Description |
| --- | --- | --- |
| DEPLOY |  | Should the workflow push the rendered slides back to the repo? Defaults to `true` |
| GITHUB_REPOSITORY | When DEPLOY is true  | The repo to publish the rendered slides to |
| GITHUB_TOKEN | When DEPLOY is true | An access to token that allows pushing to GITHUB_REPOSITORY |
| PUBLISH_TO_BRANCH | When DEPLOY is true | The branch to commit the slides on. Likely `main` or ` gh-pages`  |
| NO_FORCE_PUSH |  | Per default the action force-pushes - when working with others, or other actions that commit to the same branch this can be set to `true` to ensure the Action fails rather than overwrites changes that happened while it ran. Defaults to `false` |
| COMMIT_MSG |  | A message to use for the automated commit. Defaults to `Marp Action Build` |
| MARP_ARGS |  | Any arguments to pass directly to marp |

## 💻 Local development

    docker build -t marp-action ./
    docker run -t marp-action
