curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}" \
	-d "{\"name\": \"Goo\", \"name_i18n\": {\"en_US\": \"Goo\"}}" \
	-u "test@liferay.com:learn"