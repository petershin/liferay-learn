curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/price-lists/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"name\": \"Baker\"}" \
	-u "test@liferay.com:learn"