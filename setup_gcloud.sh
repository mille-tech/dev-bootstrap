#!/bin/bash

set -eu

if [ "$require_google_auth" = "true" ]; then
	console_only=""
	no_launch_browser=""
	if [ "$on_wsl" = "true" ]; then
		console_only="--console-only"
		no_launch_browser="--no-launch-browser"
	fi
	$HOME/google-cloud-sdk/bin/gcloud init $console_only
	$HOME/google-cloud-sdk/bin/gcloud auth login $no_launch_browser
	$HOME/google-cloud-sdk/bin/gcloud auth application-default login $no_launch_browser
	$HOME/google-cloud-sdk/bin/gcloud auth configure-docker --quiet

fi
