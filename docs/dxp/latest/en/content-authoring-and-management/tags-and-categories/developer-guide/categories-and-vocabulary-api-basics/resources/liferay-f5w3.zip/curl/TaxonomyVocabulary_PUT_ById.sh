curl \
	"http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-vocabularies/${1}" \
	-H "Content-Type: application/json" \
	-X "PUT" \
	-d "{\"description\": \"Goo\", \"name\": \"Able\"}" \
	-u "test@liferay.com:learn"