#!/bin/bash
set -euo pipefail

# Start background services that umbreld manages on the real OS.
# In a container these run as plain processes alongside umbreld.

# Samba (file sharing) - started on demand by umbreld, but must be available.
# avahi-daemon (mDNS) - requires net=host on the Docker run command.
avahi-daemon --no-drop-root -D 2>/dev/null || true

exec tini -- umbreld --data-directory /home/umbrel/umbrel "$@"
