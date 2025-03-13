#!/bin/bash
set -e

# Navigate to the root directory of the repository
cd "$(dirname "$0")/../../.."

echo "Executing assignment test script from: $(pwd)"

# Ensure finder-app exists
if [ ! -d "finder-app" ]; then
    echo "Error: finder-app directory not found!"
    exit 1
fi

# Clean and rebuild the writer application
make clean -C ./finder-app
make -C ./finder-app

# Ensure the writer binary exists
if [ ! -f "finder-app/writer" ]; then
    echo "Error: writer binary not found!"
    exit 1
fi

# Run the finder-test script
./finder-app/finder-test.sh

