curl \
	"http://localhost:8080/o/object-admin/v1.0/object-definitions/by-external-reference-code/C_DISTRIBUTOR_APPLICATION/object-layouts" \
	--data-raw '
		{
			"defaultObjectLayout": true,
			"name": {
				"en_US": "Basic Layout"
			},
			"objectDefinitionExternalReferenceCode": "C_DISTRIBUTOR_APPLICATION",
			"objectLayoutTabs": [
				{
					"name": {
						"en_US": "Application"
					},
					"objectLayoutBoxes": [
						{
							"collapsable": true,
							"name": {
								"en_US": "General Details"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "applicantName",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "applicantEmail",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "productsOfInterest",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "distributionRegions",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "orderTypesOfInterest",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "productLabeling",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "estimatedAnnualPurchaseVolume",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "comments",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Contact Information"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "primaryContactName",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "primaryContactTitle",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "primaryContactEmail",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "primaryContactPhoneNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Business Details "
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessName",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessType",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessWebsite",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessPhoneNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessEstablishedDate",
											"priority": 0,
											"size": 4
										},
										{
											"objectFieldName": "businessEmployeeNumber",
											"priority": 0,
											"size": 4
										},
										{
											"objectFieldName": "businessAnnualRevenue",
											"priority": 0,
											"size": 4
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessDistributionChannels",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessOtherBrandsOffered",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Business Address"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessAddressLineOne",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessAddressLineTwo",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessCity",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessZIPPostalCode",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessStateProvinceRegion",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessCountry",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Additional Business Information"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessLicenseNumber",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessResaleNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessTaxIDNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Attachments"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "businessLicense",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "businessProofOfInsurance",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						}
					],
					"objectRelationshipId": 0,
					"priority": 0
				},
				{
					"name": {
						"en_US": "References"
					},
					"objectLayoutBoxes": [
						{
							"collapsable": true,
							"name": {
								"en_US": "Bank Details"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankName",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "bankPhoneNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankAccountNumber",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankAddressLineOne",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankAddressLineTwo",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankCity",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "bankZIPPostalCode",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "bankStateProvinceRegion",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "bankCountry",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						},
						{
							"collapsable": true,
							"name": {
								"en_US": "Credit Reference Details"
							},
							"objectLayoutRows": [
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "referenceSupplierName",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "referencePhoneNumber",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "referenceOneAddressLineOne",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "referenceAddressLineTwo",
											"priority": 0,
											"size": 12
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "referenceCity",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "referenceZIPPostalCode",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								},
								{
									"objectLayoutColumns": [
										{
											"objectFieldName": "referenceStateProvinceRegion",
											"priority": 0,
											"size": 6
										},
										{
											"objectFieldName": "referenceCountry",
											"priority": 0,
											"size": 6
										}
									],
									"priority": 0
								}
							],
							"priority": 0,
							"type": "regular"
						}
					],
					"objectRelationshipId": 0,
					"priority": 0
				}
			]
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"