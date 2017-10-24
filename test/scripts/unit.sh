#!/bin/bash
#
# Copyright SecureKey Technologies Inc. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
# Environment variables that affect this script:
# GO_TESTFLAGS: Flags are added to the go test command.
# GO_LDFLAGS: Flags are added to the go test command (example: -ldflags=-s).

set -e

GO_CMD="${GO_CMD:-go}"

REPO="github.com/uhuchain/uhu-hlf-client"

# Packages to exclude
PKGS=`$GO_CMD list $REPO... 2> /dev/null | \
      grep -v ^$REPO/vendor/ | grep -v ^$REPO/test/`
echo "Running unit tests..."

RACEFLAG=""
ARCH=$(uname -m)

if [ "$ARCH" == "x86_64" ]
then
    RACEFLAG="-race"
fi
$GO_CMD test $RACEFLAG -cover -tags "$GO_TAGS" $GO_TESTFLAGS $GO_LDFLAGS $PKGS -p 1 -timeout=40m