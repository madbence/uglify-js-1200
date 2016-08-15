#!/bin/bash

browserify \
  -d \
  -t  babelify \
  src/foo.js \
  -o public/bundle.inlined.js

exorcist \
  -b . \
  public/bundle.js.map \
  < public/bundle.inlined.js \
  > public/bundle.js

uglifyjs \
  --source-map-include-sources \
  --source-map-root . \
  --in-source-map public/bundle.js.map \
  --source-map public/bundle.min.js.map \
  --source-map-url bundle.min.js.map \
  --compress --mangle \
  -o public/bundle.min.js \
  -- public/bundle.js
