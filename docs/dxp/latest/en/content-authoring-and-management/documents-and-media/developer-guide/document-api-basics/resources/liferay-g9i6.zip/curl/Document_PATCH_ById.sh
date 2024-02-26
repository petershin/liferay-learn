curl \
	"http://localhost:8080/o/headless-delivery/v1.0/documents/${1}" \
	--form "document={\"description\": \"Bar\"}" \
	--form "file=@Document_POST_ToSite.sh" \
	--header "Content-Type: multipart/form-data; boundary=ARBITRARY" \
	--request "PATCH" \
	--user "test@liferay.com:learn"