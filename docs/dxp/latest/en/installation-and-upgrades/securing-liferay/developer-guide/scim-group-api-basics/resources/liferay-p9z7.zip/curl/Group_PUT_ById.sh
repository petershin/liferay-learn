curl \
   "http://localhost:8080/o/scim/v1.0/v2/Groups/${1}" \
   --data-raw '
      {
         "displayName": "Bar"
      }' \
   --header "Content-Type: application/scim+json" \
   --request "PUT" \
   --user "test@liferay.com:learn"