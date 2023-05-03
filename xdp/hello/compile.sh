#!/bin/bash

clang -O2 -g -Wall -target bpf -c xdp_drop.c -o xdp_drop.o
