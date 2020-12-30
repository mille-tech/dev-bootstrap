#!/bin/bash

set -eu

if [ "$require_google_auth" = "true" ]; then
	$HOME/google-cloud-sdk/bin/gcloud init --console-only
	$HOME/google-cloud-sdk/bin/gcloud auth login --no-launch-browser
	$HOME/google-cloud-sdk/bin/gcloud auth application-default login --no-launch-browser
	$HOME/google-cloud-sdk/bin/gcloud auth configure-docker --quiet

fi
