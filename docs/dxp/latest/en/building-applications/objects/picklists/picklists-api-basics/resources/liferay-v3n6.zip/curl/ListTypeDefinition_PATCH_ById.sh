curl \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}" \
	-d "{\"name\": \"Bar\", \"name_i18n\": {\"en_US\": \"Bar\"}}" \
	-u "test@liferay.com:learn"