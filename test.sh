#!/bin/bash

VOLUMES="-v ${STATES:=/srv/salt}:/srv/salt -v ${PILLAR:=/srv/pillar}:/srv/pillar"
if [ -n "$CONFIG" ]; then
    VOLUMES="$VOLUMES -v $CONFIG:/etc/salt"
fi

docker run $VOLUMES salt-minion:latest salt-call --local state.highstate test=True
