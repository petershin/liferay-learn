curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/terms/${1}" \
	-d "{\"label\": {\"en_US\": \"Bar\"}}" \
	-u "test@liferay.com:learn"