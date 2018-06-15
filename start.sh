#!/bin/bash

eval $(/bin/aws-env)

env

node --harmony app.js --verbose
