#!/usr/bin/env bash

(cd ../general_ledger && ENV=production rake) &

sleep 1

(cd ../portfolio_analysis && pipenv run make start) &

sleep 1

yarn run start
