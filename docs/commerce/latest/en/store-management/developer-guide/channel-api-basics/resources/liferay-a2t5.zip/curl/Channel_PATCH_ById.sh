curl \
	"http://localhost:8080/o/headless-commerce-admin-channel/v1.0/channels/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"name\": \"Bar\"}" \
	-u "test@liferay.com:learn"