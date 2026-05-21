#!/bin/bash

podman rm AutoCodeQLAnalyzer

podman rmi autocodeqlanalyzer

./start.sh
