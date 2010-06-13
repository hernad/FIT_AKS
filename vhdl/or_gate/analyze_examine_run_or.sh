#!/bin/bash

OPTIONS=" --workdir=work"

mkdir work



CMD="ghdl -a $OPTIONS or_gate.vhdl"

echo 1. analize: $CMD
$CMD

CMD="ghdl -a $OPTIONS or_test.vhdl"

echo 1b. analize: $CMD
$CMD



CMD="ghdl -e $OPTIONS or_test"

echo 2. examine: $CMD

$CMD



CMD="ghdl -r $OPTIONS or_test --vcd=or_test.vcd"

echo 3. run - vcd output: $CMD

$CMD




