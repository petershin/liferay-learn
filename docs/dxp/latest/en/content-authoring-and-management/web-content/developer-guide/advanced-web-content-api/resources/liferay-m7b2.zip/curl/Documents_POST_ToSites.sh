curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents" \
	--form "file=@${2}" \
	--header "Content-Type: multipart/form-data" \
	--request "POST" \
	--user "test@liferay.com:learn"