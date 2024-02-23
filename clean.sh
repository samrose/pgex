#!/bin/bash
# shellcheck shell=bash
echo 'Cleaning up...'
rm -rf postgres_data
rm -rf postgres
echo 'Done!'
