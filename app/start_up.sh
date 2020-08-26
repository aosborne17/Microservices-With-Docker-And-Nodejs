#!/bin/bash

echo "ENTRYPOINT"
node seeds/seed.js
node app.js
