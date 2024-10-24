curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-posting-images" \
	--form "file=@liferay.png" \
	--header "Content-Type: multipart/form-data" \
	--request "POST" \
	--user "test@liferay.com:learn"