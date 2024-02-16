curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/documents" \
	-F "file=@${1}" \
	-H "Content-Type: multipart/form-data" \
	-X "POST" \
	-u "test@liferay.com:learn"