# WAT

Quick bootstrap of a vallheim server via `docker-composer`

# Start

Clone this repo and create an .env file

```
SERVER_NAME=My Vallheim
WORLD=My World
PASSWORD=secretpassword
SKIP_AUTOUPDATES=0
```

Then start with

```
./start.sh
# or
docker-compose up -d
```

# Updates

If you disabled autoupdates by setting `SKIP_AUTOUPDATES=1` you will need to run this from time to time (manually)

```bash
./update_valheim.sh
```

If it finds an update, it will restart the server, otherwise it will just continue running

# Credits

All the credits to https://github.com/lloesche/valheim-server-docker
