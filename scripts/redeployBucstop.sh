#!/bin/bash

sudo docker pull jamesispark/bucstop

sudo docker compose up --no-deps -d bucstop

sudo docker image prune -f
