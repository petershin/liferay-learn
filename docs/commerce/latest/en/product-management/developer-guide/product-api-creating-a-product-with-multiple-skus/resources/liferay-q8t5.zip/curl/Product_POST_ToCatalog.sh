curl \
	 -H "Content-Type: application/json" \
	 -X POST \
	 "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products" \
	 -d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productOptions\": [{\"fieldType\": \"select\", \"key\": \"foo\", \"name\": {\"en_US\": \"Foo\"}, \"optionId\": \"${2}\", \"required\": true, \"skuContributor\": true}], \"productType\": \"simple\", \"skus\": [{\"published\": true, \"purchasable\": true, \"sku\": \"TEST001\", \"skuOptions\": [{\"key\": \"foo\", \"value\": \"Able\"}]}, {\"published\": true, \"purchasable\": true, \"sku\": \"TEST002\", \"skuOptions\": [{\"key\": \"foo\", \"value\": \"Baker\"}]}]}" \
	 -u "test@liferay.com:learn"