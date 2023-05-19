curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"aa73cd4b-681d-8861-3fee-7eec47689399\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Contact Name\"},\"name\":\"businessContactName\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"bd9cb4f6-368e-9f32-4072-578225955a3e\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Contact Title\"},\"name\":\"businessContactTitle\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"022c6eb1-0218-2240-8930-0baffa435acd\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Contact Email\"},\"name\":\"businessContactEmail\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"aee02655-5915-d185-11e0-7376080cf9bc\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Contact Phone Number\"},\"name\":\"businessContactPhoneNumber\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"