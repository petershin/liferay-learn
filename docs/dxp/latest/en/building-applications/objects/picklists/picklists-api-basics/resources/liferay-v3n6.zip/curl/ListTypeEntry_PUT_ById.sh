curl \
	-H "Content-Type: application/json" \
	-X "PUT" \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-entries/${1}" \
	-d "{\"name\": \"Baker\", \"name_i18n\": {\"en_US\": \"Baker\"}}" \
	-u "test@liferay.com:learn"