FROM jojomi/hugo as build

COPY ./ /src

RUN hugo --source=/src --destination=/tmp/html

FROM nginx:stable

COPY --from=build /tmp/html /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

