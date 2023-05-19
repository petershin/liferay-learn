curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"4fcaeb8c-3a4e-d68a-5aa9-13f79e28c7f1\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Name\"},\"name\":\"businessName\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Date\",\"businessType\":\"Date\",\"externalReferenceCode\":\"fa37495e-d96c-ef08-f994-2f294845a37e\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Established Date\"},\"name\":\"businessEstablishedDate\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Date\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Picklist\",\"externalReferenceCode\":\"c8131574-6198-7dc6-abf1-704278f5771c\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Type\"},\"listTypeDefinitionExternalReferenceCode\":\"LIST_BUSINESS_TYPES\",\"name\":\"businessType\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"761b63e0-c682-cb29-1fa1-03dbcdfc47fb\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Website\"},\"name\":\"businessWebsite\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"ca5dfb60-8ee0-5d14-65bd-b5b612b9e785\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Email\"},\"name\":\"businessEmail\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"788ff32f-2c16-49b6-f0a4-70ad9525ac9c\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Phone Number\"},\"name\":\"businessPhoneNumber\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"e2b79ed5-c7af-678f-a29e-7c8165caa09e\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Fax Number\"},\"name\":\"businessFaxNumber\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"0f84fbf5-10f2-cf17-ae3a-5997324028be\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Address Line One\"},\"name\":\"businessAddressLineOne\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"b720f065-1b1f-0e92-0ee1-894d31a3a316\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Address Line Two\"},\"name\":\"businessAddressLineTwo\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"7adbd2a1-c2c9-3ae4-7805-bb25cffaeda3\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business City\"},\"name\":\"businessCity\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"232c1922-01d4-e77a-ec86-9b72eaf0618b\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business State, Province, Region\"},\"name\":\"businessStateProvinceRegion\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"String\",\"businessType\":\"Text\",\"externalReferenceCode\":\"02b481fb-5a0c-e352-3166-3535f2841a67\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business Country\"},\"name\":\"businessCountry\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"String\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"c3529e16-a54f-b5c6-d84a-829ed5cdd821\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Zip, Postal Code\"},\"name\":\"businessZipPostalCode\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"1980893e-a034-a4f7-62ec-0876a3af0a6c\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business License Number\"},\"name\":\"businessLicenseNumber\",\"objectFieldSettings\":[],\"required\":true,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"926708b8-2463-a964-9928-ad238d6a20cc\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Resale Number\"},\"name\":\"businessResaleNumber\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Integer\",\"businessType\":\"Integer\",\"externalReferenceCode\":\"19853289-be70-8377-b7f6-e321ec3572a9\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"\",\"label\":{\"en_US\":\"Business Tax ID Number\"},\"name\":\"businessTaxIDNumber\",\"objectFieldSettings\":[],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Integer\"}" \
	-u "test@liferay.com:learn"

curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\":\"Long\",\"businessType\":\"Attachment\",\"externalReferenceCode\":\"a7c8b085-cf1d-87b2-61af-c0cfb5e85796\",\"indexed\":true,\"indexedAsKeyword\":false,\"indexedLanguageId\":\"en_US\",\"label\":{\"en_US\":\"Business License\"},\"name\":\"businessLicense\",\"objectFieldSettings\":[{\"name\":\"acceptedFileExtensions\",\"value\":\"jpeg, jpg, pdf, png\"},{\"name\":\"maximumFileSize\",\"value\":\"100\"},{\"name\":\"fileSource\",\"value\":\"userComputer\"},{\"name\":\"showFilesInDocumentsAndMedia\",\"value\":\"true\"},{\"name\":\"storageDLFolderPath\",\"value\":\"/DistributorApplication\"}],\"required\":false,\"state\":false,\"system\":false,\"type\":\"Long\"}" \
	-u "test@liferay.com:learn"

