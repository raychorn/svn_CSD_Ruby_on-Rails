#!/bin/bash

rake tmp:clear
nice -n -20 rails server -e development -p 9999


