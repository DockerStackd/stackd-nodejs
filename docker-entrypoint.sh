#!/bin/sh

set -eo pipefail

npm install

exec ${START_CMD}
