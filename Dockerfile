FROM klakegg/hugo:ext-alpine-ci as build

ADD . .

RUN npm i  --unsafe-perm && hugo


FROM caddy

ENV TZ=Asia/Shanghai

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /src/public /srv