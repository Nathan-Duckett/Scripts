#!/bin/sh

# Author: Nathan Duckett

if [ $# -ne 1 ]; then
    echo "Invalid arguments expects: version_number"
    return
fi

export JAVA_HOME="/usr/lib/jvm/java-$1-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"

echo "Java version successfully set to $1"