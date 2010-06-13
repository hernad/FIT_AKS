#!/bin/bash


OPTIONS="--ieee=synopsys --workdir=work"

mkdir work

CMD="ghdl -a $OPTIONS hello_world.vhdl"

echo 1. analize: $CMD

$CMD

CMD="ghdl -e $OPTIONS hello_world"

echo 2. examine: $CMD

$CMD

CMD="ghdl -r $OPTIONS hello_world"

echo 3. run: $CMD

$CMD




