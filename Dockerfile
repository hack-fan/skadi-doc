FROM klakegg/hugo:ext-alpine-ci as build

ADD . .

RUN npm i && hugo


FROM caddy

ENV TZ=Asia/Shanghai

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /src/public /srv