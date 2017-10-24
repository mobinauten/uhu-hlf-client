/*
Copyright SecureKey Technologies Inc. All Rights Reserved.
SPDX-License-Identifier: Apache-2.0
*/

package main

import (
	"io/ioutil"
	"os"
	"testing"

	"github.com/uhuchain/uhu-hlf-client/config"
	"github.com/uhuchain/uhu-hlf-client/log"
)

func init() {
	log.InitLog(ioutil.Discard, os.Stdout, os.Stdout, os.Stderr)
}

func TestInitialization(t *testing.T) {
	t.Log("### Starting TestInitialization ###")
	setup := &config.ClientConfig{
		ConfigFile:      "../fixtures/config/config.yaml",
		ChannelID:       "mychannel",
		OrgID:           "Org1",
		ChannelConfig:   "../fixtures/channel/mychannel.tx",
		ConnectEventHub: true,
	}
	err := setup.Initialize()
	if err != nil {
		t.Errorf("Failed to init blockchain client. Message: %s", err)
	}
	t.Log("### Finnished TestInitialization ###")
}
