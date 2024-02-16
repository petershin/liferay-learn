curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/${1}/list-type-entries" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"key\": \"able\", \"name\": \"Able\", \"name_i18n\": {\"en_US\": \"Able\"}}" \
	-u "test@liferay.com:learn"