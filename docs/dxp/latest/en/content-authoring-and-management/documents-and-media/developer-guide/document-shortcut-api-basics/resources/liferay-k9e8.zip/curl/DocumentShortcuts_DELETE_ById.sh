curl \
	"http://localhost:8080/o/headless-delivery/v1.0/document-shortcuts/${1}" \
	--header "accept: application/json" \
	--request "DELETE" \
	--user "test@liferay.com:learn"