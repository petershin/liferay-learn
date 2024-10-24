curl \
	"http://localhost:8080/o/headless-delivery/v1.0/documents/${1}" \
	--form "document={\"description\": \"Goo\", \"title\": \"Document_PUT_ById.sh\"}" \
	--form "file=@Document_PUT_ById.sh" \
	--header "Content-Type: multipart/form-data; boundary=ARBITRARY" \
	--request "PUT" \
	--user "test@liferay.com:learn"