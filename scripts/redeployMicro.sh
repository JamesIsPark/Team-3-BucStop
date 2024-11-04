#!/bin/bash

sudo docker pull jamesispark/gamemicro

sudo docker compose up --no-deps -d micro

sudo docker image prune -f
