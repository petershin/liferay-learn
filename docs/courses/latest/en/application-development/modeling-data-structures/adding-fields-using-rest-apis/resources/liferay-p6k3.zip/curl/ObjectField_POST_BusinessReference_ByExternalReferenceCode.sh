# Reference Supplier Name
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "583346a1-7bbf-d382-0ae9-a49150010a87",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference Supplier Name"
			},
			"name": "referenceSupplierName",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference Phone Number
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "8e17948a-dbc7-988c-3760-61bc790eaeb5",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "",
			"label": {
				"en_US": "Reference Phone Number"
			},
			"name": "referencePhoneNumber",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference Address Line One
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "ea06823c-d47c-3d05-850d-1143ed6269ad",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference Address Line One"
			},
			"name": "referenceOneAddressLineOne",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference Address Line Two
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "1d0142cb-3f4c-f90a-c181-0b7b7feb86e2",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference Address Line Two"
			},
			"name": "referenceAddressLineTwo",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference City
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "b61d87a1-c078-a763-9cd8-e15bbba4013d",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference City"
			},
			"name": "referenceCity",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference State, Province, Region
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "3525699a-3241-cee6-417e-d7262729fd28",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference State, Province, Region"
			},
			"name": "referenceStateProvinceRegion",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference ZIP, Postal Code
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "73e4466d-7ebc-f26d-1701-a77db64cc152",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "",
			"label": {
				"en_US": "Reference ZIP, Postal Code"
			},
			"name": "referenceZIPPostalCode",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF

# Reference Country
curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-fields" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn" \
	--data-binary @- << EOF
		{
			"DBType": "String",
			"businessType": "Text",
			"externalReferenceCode": "b8d3263b-55e5-bd82-19cf-e92af2bd2353",
			"indexed": true,
			"indexedAsKeyword": false,
			"indexedLanguageId": "en_US",
			"label": {
				"en_US": "Reference Country"
			},
			"name": "referenceCountry",
			"objectFieldSettings": [],
			"required": false,
			"state": false,
			"system": false,
			"type": "String"
		}
EOF
