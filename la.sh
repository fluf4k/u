#!/bin/bash
packetcrypt blk http://pkteerpool.com \
    --bind 0.0.0.0:6666 \
    --handlerpass MCSfcwbJStBZEEvauyDdAUqrQY \
    --mcast 233.0.4.20 \
    -m 150000 \
    -f 0.35 \
    -p pkt1quc86lqjs608mjf007k7guqjtxr430fx0m62glu \
    --subscribe \
        172.31.4.26:7800 \
        172.31.4.160:7800 \
        172.31.15.241:7800 \
        172.31.0.36:7800 \
        172.31.7.164:7800 \
        172.31.1.54:7800
