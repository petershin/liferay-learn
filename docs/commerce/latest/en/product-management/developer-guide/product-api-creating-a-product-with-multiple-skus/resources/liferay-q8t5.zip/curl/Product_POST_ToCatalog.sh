curl \
	"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productOptions\": [{\"fieldType\": \"select\", \"key\": \"able\", \"name\": {\"en_US\": \"Able\"}, \"optionId\": \"${2}\", \"required\": true, \"skuContributor\": true}], \"productType\": \"simple\", \"skus\": [{\"published\": true, \"purchasable\": true, \"sku\": \"SKU-01\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Baker\"}]}, {\"published\": true, \"purchasable\": true, \"sku\": \"SKU-02\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Charlie\"}]}]}" \
	-u "test@liferay.com:learn"