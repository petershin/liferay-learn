curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-postings/unsubscribe" \
	--header "Content-type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"