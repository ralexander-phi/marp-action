# marp-action

Build a Marp Presentation Website from a repo


## Inputs

* MARP\_ARGS - Build arguements for Marp
* GITHUB\_ACTOR - Who is performing actions (I.E. Jenkins)
* GITHUB\_REPOSITORY - The repository to push to
* GITHUB\_TOKEN - A GitHub application access token to use


## Example

    MARP\_ARGS=slides.md -o index.html


## Local testing

docker build -t marp-action ./
docker run -t marp-action
