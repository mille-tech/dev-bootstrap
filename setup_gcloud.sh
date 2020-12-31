#!/bin/bash

set -eu


console_only=""
no_launch_browser=""
for OPT in "$@"
do
	case $OPT in
		--no-browser)
			console_only="--console-only"
			no_launch_browser="--no-launch-browser"
			shift 1;;
	esac
done

$HOME/google-cloud-sdk/bin/gcloud init $console_only
$HOME/google-cloud-sdk/bin/gcloud auth login $no_launch_browser
$HOME/google-cloud-sdk/bin/gcloud auth application-default login $no_launch_browser
$HOME/google-cloud-sdk/bin/gcloud auth configure-docker --quiet
