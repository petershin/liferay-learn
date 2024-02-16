curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents" \
	-F "file=@Document_POST_ToSite.sh" \
	-H "Content-Type: multipart/form-data" \
	-X "POST" \
	-u "test@liferay.com:learn"