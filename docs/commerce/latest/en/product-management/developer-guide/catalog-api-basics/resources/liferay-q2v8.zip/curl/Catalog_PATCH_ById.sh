curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/catalog/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"name\": \"Bar\"}" \
	-u "test@liferay.com:learn"