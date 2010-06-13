#!/bin/bash

OPTIONS="  --ieee=synopsys --workdir=work"

mkdir work



CMD="ghdl -a $OPTIONS nor_gate.vhdl"

echo 1. analize: $CMD
$CMD

CMD="ghdl -a $OPTIONS flip_flop.vhdl"

echo 1b. analize: $CMD
$CMD



CMD="ghdl -e $OPTIONS flip_flop"

echo 2. examine: $CMD

$CMD



CMD="ghdl -r $OPTIONS flip_flop --vcd=flip_flop.vcd"

echo 3. run - vcd output: $CMD

$CMD

