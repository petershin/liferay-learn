curl \
   "http://localhost:8080/o/scim/v1.0/v2/Users/${1}" \
   --request "DELETE" \
   --user "test@liferay.com:learn"