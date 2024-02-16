curl \
	"http://localhost:8080/o/headless-commerce-admin-inventory/v1.0/warehouses/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"name\": {\"en_US\": \"Bar\"}}" \
	-u "test@liferay.com:learn"