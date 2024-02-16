curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-posting-images" \
	-F "file=@liferay.png" \
	-H "Content-Type: multipart/form-data" \
	-X "POST" \
	-u "test@liferay.com:learn"