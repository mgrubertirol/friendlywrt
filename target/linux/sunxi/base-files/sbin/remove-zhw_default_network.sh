#!/bin/sh
#set -ex

uci set zhw_default_network.zhw_default_network.this_enable='false'
uci commit zhw_default_network

