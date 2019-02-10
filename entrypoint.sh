#! /bin/bash
set -e

# Remove a tmp folder
rm -R /message-me/tmb

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"