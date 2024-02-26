curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/documents" \
	--form "file=@${1}" \
	--header "Content-Type: multipart/form-data" \
	--request "POST" \
	--user "test@liferay.com:learn"