# Business Name
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"4fcaeb8c-3a4e-d68a-5aa9-13f79e28c7f1\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business Name\"}, \"name\": \"businessName\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Website
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"761b63e0-c682-cb29-1fa1-03dbcdfc47fb\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business Website\"}, \"name\": \"businessWebsite\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Established Date
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"Date\", \"businessType\": \"Date\", \"externalReferenceCode\": \"fa37495e-d96c-ef08-f994-2f294845a37e\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business Established Date\"}, \"name\": \"businessEstablishedDate\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"Date\"}" \
	-u "test@liferay.com:learn"

# Business Employee Number
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"Integer\", \"businessType\": \"Integer\", \"externalReferenceCode\": \"ca866010-11d1-9746-f41c-0d7aae4df8a4\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Number of Employees\"}, \"name\": \"businessEmployeeNumber\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"Integer\"}" \
	-u "test@liferay.com:learn"

# Business Annual Revenue
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"0fdc9d61-5e7d-9605-97bc-e5d28a87ccbd\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Annual Revenue (in USD)\"}, \"name\": \"businessAnnualRevenue\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Other Brands Offered
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"Clob\", \"businessType\": \"LongText\", \"externalReferenceCode\": \"32b87935-43d1-05e6-2cd8-a0329561b6bb\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Other Brands Offered\"}, \"name\": \"businessOtherBrandsOffered\", \"objectFieldSettings\": [{\"name\": \"showCounter\", \"value\": \"false\"}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"Clob\"}" \
	-u "test@liferay.com:learn"

# Business Phone Number
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"788ff32f-2c16-49b6-f0a4-70ad9525ac9c\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business Phone Number\"}, \"name\": \"businessPhoneNumber\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Address Line One
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"0f84fbf5-10f2-cf17-ae3a-5997324028be\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business Address Line One\"}, \"name\": \"businessAddressLineOne\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Address Line Two
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"b720f065-1b1f-0e92-0ee1-894d31a3a316\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business Address Line Two\"}, \"name\": \"businessAddressLineTwo\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business City
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"7adbd2a1-c2c9-3ae4-7805-bb25cffaeda3\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business City\"}, \"name\": \"businessCity\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business State/Province/Region
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"232c1922-01d4-e77a-ec86-9b72eaf0618b\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business State, Province, Region\"}, \"name\": \"businessStateProvinceRegion\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business ZIP/Postal Code
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"c3529e16-a54f-b5c6-d84a-829ed5cdd821\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business ZIP, Postal Code\"}, \"name\": \"businessZIPPostalCode\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Country
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"02b481fb-5a0c-e352-3166-3535f2841a67\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business Country\"}, \"name\": \"businessCountry\", \"objectFieldSettings\": [], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business License Number
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"1980893e-a034-a4f7-62ec-0876a3af0a6c\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business License Number\"}, \"name\": \"businessLicenseNumber\", \"objectFieldSettings\": [{\"name\": \"uniqueValues\", \"value\": true}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Resale Number
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"926708b8-2463-a964-9928-ad238d6a20cc\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business Resale Number\"}, \"name\": \"businessResaleNumber\", \"objectFieldSettings\": [{\"name\": \"uniqueValues\", \"value\": true}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business Tax ID Number
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"String\", \"businessType\": \"Text\", \"externalReferenceCode\": \"19853289-be70-8377-b7f6-e321ec3572a9\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"\", \"label\": {\"en_US\": \"Business Tax ID Number\"}, \"name\": \"businessTaxIDNumber\", \"objectFieldSettings\": [{\"name\": \"uniqueValues\", \"value\": true}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"String\"}" \
	-u "test@liferay.com:learn"

# Business License
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"Long\", \"businessType\": \"Attachment\", \"externalReferenceCode\": \"a7c8b085-cf1d-87b2-61af-c0cfb5e85796\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Business License\"}, \"name\": \"businessLicense\", \"objectFieldSettings\": [{\"name\": \"acceptedFileExtensions\", \"value\": \"jpeg, jpg, pdf, png\"}, {\"name\": \"maximumFileSize\", \"value\": \"100\"}, {\"name\": \"fileSource\", \"value\": \"userComputer\"}, {\"name\": \"showFilesInDocumentsAndMedia\", \"value\": \"true\"}, {\"name\": \"storageDLFolderPath\", \"value\": \"/DistributorApplication\"}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"Long\"}" \
	-u "test@liferay.com:learn"

# Business Proof of Insurance
curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	-d "{\"DBType\": \"Long\", \"businessType\": \"Attachment\", \"externalReferenceCode\": \"b64f9212-fc82-9065-ea15-ebe5a0500190\", \"indexed\": true, \"indexedAsKeyword\":false,\"indexedLanguageId\": \"en_US\", \"label\": {\"en_US\": \"Proof of Insurance\"}, \"name\": \"businessProofOfInsurance\", \"objectFieldSettings\": [{\"name\": \"acceptedFileExtensions\", \"value\": \"jpeg, jpg, pdf, png\"}, {\"name\": \"maximumFileSize\", \"value\": \"100\"}, {\"name\": \"fileSource\", \"value\": \"userComputer\"}, {\"name\": \"showFilesInDocumentsAndMedia\", \"value\": \"true\"}, {\"name\": \"storageDLFolderPath\", \"value\": \"/DistributorApplication\"}], \"required\":false,\"state\":false,\"system\":false,\"type\": \"Long\"}" \
	-u "test@liferay.com:learn"
