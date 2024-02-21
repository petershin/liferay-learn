# Bank Name
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "a3ebb708-d369-02c0-9baf-f041f9657b9c",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank Name"
			},
			"name": "bankName",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank Account Number
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "f94523ad-b613-70d5-6048-73ca5ccc826c",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank Account Number"
			},
			"name": "bankAccountNumber",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}"
EOF

# Bank Phone Number
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "252a0d43-11eb-b9e0-42e4-97e1b2dce029",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "",
			"label": {
			"en_US": "Bank Phone Number"
			},
			"name": "bankPhoneNumber",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank Address Line One
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "7acb3fd4-3e8d-81a2-2ca3-ce58a4b8ebce",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank Address Line One"
			},
			"name": "bankAddressLineOne",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank Address Line Two
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "e3f4621d-b1cf-7e72-c90c-64cd49fa7c22",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank Address Line Two"
			},
			"name": "bankAddressLineTwo",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank City
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "3cb5060d-ed6d-1510-0899-8ac17399b8f4",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank City"
			},
			"name": "bankCity",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank State, Province, Region
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "8fcd146b-ef0b-a135-1e35-c7b0570a8f1a",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank State, Province, Region"
			},
			"name": "bankStateProvinceRegion",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank ZIP, Postal Code
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "730e6a54-65bd-5672-0455-9489d4c95302",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "",
			"label": {
				"en_US": "Bank ZIP, Postal Code"
			},
			"name": "bankZIPPostalCode",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Bank Country
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "c8268d73-9dbb-1d11-0e6f-8437c10eca6c",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Bank Country"
			},
			"name": "bankCountry",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF
