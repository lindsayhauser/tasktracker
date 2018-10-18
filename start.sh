#!/bin/bash
  
export MIX_ENV=prod
export PORT=4747

echo "Stopping old copy of app, if any..."

_build/prod/rel/memory/bin/memory stop || true

echo "Starting app..."

# TODO: You want start.

_build/prod/rel/memory/bin/memory start
