FROM node:16.8

LABEL description "A GitHub Action to build a Marp Presentation website to GitHub Pages"
LABEL repository "http://github.com/ralexander-phi/marp-action"

RUN apt update && apt install -y git

RUN npm install -g @marp-team/marp-cli@1.4.0

ENV IS_DOCKER true

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

