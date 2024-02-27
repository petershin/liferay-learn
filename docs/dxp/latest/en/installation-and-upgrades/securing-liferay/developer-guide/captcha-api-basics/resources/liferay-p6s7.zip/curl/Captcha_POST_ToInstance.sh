curl \
   "http://localhost:8080/o/captcha/v1.0/captcha/response" \
   --data-raw "
      {
         \"answer\": \"${1}\",
         \"token\": \"${2}\"
      }" \
   --header "Content-Type: application/json" \
   --request "POST" \
   --user "test@liferay.com:learn"