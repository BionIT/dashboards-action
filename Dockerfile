FROM joycelulu/playground-actions:test

RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python