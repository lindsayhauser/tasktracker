export PORT=4747
export NODEBIN=`pwd`/assets/node_modules/.bin
export PATH="$PATH:$NODEBIN"
export MIX_ENV=prod

echo "Building..."

mkdir -p ~/.config

mix deps.get
mix compile
(cd assets && npm install)
(cd assets && webpack --mode production)
mix phx.digest

# Run so db starts up
mix run priv/repo/seeds.exs

echo "Generating release..."
mix release

echo "Starting app..."

_build/prod/rel/memory/bin/memory start
