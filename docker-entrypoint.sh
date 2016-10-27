#!/bin/sh

set -eo pipefail

npm install

if [ -n "$EXEC_CMD" ]; then
  exec ${EXEC_CMD}
else
  exec npm start
fi
