#!/bin/bash

set -eu

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export fly_target=${fly_target:-orders}
echo "Concourse API target ${fly_target}"
echo "SVC $(basename $DIR)"

pushd $DIR
  fly -t ${fly_target} set-pipeline -p orders -c pipeline.yml -l credentials.yml -n 
  fly -t ${fly_target} unpause-pipeline -p orders
  fly -t ${fly_target} trigger-job -w -j orders/build-orders
popd

