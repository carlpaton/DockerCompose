printf '\nWaiting for Website to startup  \n'
       while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080)" != "404" ]]; do printf '.' sleep 5; done
printf '\n\nWebsite has Started  \n\n'