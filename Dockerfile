FROM node:16.15.0-alpine3.15

ENV NODE_ENV=production

WORKDIR /srv/www/apostrophe
RUN chown -R node: /srv/www/apostrophe

USER node

COPY --chown=node package*.json /srv/www/apostrophe/

RUN npm ci

COPY --chown=node . /srv/www/apostrophe/

#RUN --./scripts/build-assets

CMD ["node", "app.js"]