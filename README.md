# ipmb/salt-minion

A simple Dockerfile to setup a salt-minion for dry-run testing of Salt states.
This is nice for sanity checking formatting before pushing to a live server.

You can either download the image via `docker pull ipmb/salt-minion` or build it
from the Dockerfile with `docker build -t salt-minion .`

The included shell script can be used to run a test highstate. It will use the
states and pillars from your local filesystem and run the minion masterless. 

It uses environment variables for configuration:

    STATES=/path/to/my/states PILLAR=/path/to/my/pillar ./test.sh

If you'd like, you can also specify a directory to use for config in place of
`/etc/salt`. This is helpful if you want to override the minion's default
configuration.

    STATES=/path/to/my/states PILLAR=/path/to/my/pillar CONFIG=/path/to/my/config ./test.sh

In `/path/to/my/config/minion` you could have something like this:

    file_client: local
    test: True
    log_level: warning
    state_output: mixed
    id: myserver.example.com
