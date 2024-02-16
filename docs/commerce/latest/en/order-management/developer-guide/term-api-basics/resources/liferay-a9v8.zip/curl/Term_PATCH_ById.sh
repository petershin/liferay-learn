curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"label\": {\"en_US\": \"Bar\"}}" \
	-u "test@liferay.com:learn"