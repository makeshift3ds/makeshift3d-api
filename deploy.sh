#!/bin/bash

##########################################
#     Poor Mans Continous Deployment     #
##########################################
# Use rsync to copy build directory to   #
# remote server when all checks have     #
# completed.                             #
#                                        #
# MacOS specific because of notification #
##########################################

failure () {
  local NOTIFICATION="deployed failed at $1"
  say $NOTIFICATION
  osascript -e "display notification \"${NOTIFICATION//\"/\\\"}\" with title \"Deploy Failed\""
}

success () {
  say "Deploy completed successfully."
  osascript -e 'display notification "Deploy completed successfully." with title "Deploy Successful"'
}

runCmd () {
  if $1; then
    say $2 ' was successful.'
  else
    failure $2
    exit 1
  fi
}

runCmd 'npm run lint:js' 'linting' &&
runCmd 'npm run test' 'testing' &&
runCmd "rsync -rav --exclude=node_modules -e ssh `pwd`/* bitnami@${MAKESHIFT3D_API_IP}:/home/bitnami/htdocs" 'deploy' &&
success