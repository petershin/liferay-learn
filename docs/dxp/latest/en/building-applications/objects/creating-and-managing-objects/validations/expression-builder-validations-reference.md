---
uuid: 2ef89ecc-8c75-43e3-86c1-420d6bbc3a25
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Expression Builder Validations Reference

{bdg-secondary}`Liferay 7.4 U67+/GA67+`

With custom Objects, you can create field validations using Liferay's Expression Builder. This tool provides an integrated editor for quickly defining complex validation rules using predefined fields, operators, and functions. You can browse available elements in the conditions side panel.

```{important}
Expression Builder validations can only be used with text, numeric, date, and Boolean field types.
```

## Text Fields

Liferay provides the following operators and functions for Text and Long Text fields. You can use any of these fields as arguments. With some elements, you can also add string values to compare with the field's value (e.g., `"foo"`, `"[A-Za-z]{1,50}"`).

### Concat

Combines multiple strings or text fields and return a single string that can be used with other validation functions.

```
concat([textField], "[string]")
```

### Condition (with Text)

Checks if user input meets one or more conditions and returns a Boolean value. This function works like `if` statements. Each expression includes at least one `condition` (e.g., `textFieldName == "foo"`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `textFieldName == "foo", textFieldName == "bar", true, false`).

```
condition([condition], [return-value])
```

### Contains (with Text)

Checks if a text field contains a specific string value and returns a Boolean. If the field *does not* contain the value, it returns `false`.

```
contains([textField], "[string]")
```

### Does Not Contain (with Text)

Checks if a text field does not contain a specific string value and returns a Boolean. If the field *does* contain the value, it returns `false`.

```
NOT(contains([textField], "[string]"))
```

### Is a URL

Checks if a text field is a URL and returns a Boolean. If the field does not match a URL pattern, it returns `false`. To return `true`, entries must use standard URL elements (e.g., `http`, `://`, `.com`)

```
isURL([textField])
```

### Is an Email

Checks if a text field is an email and returns a Boolean. If the field does not match a specific email or email pattern, it returns `false`. To return `true`, entries must use standard email elements (e.g., `@gmail`, `.com`)

```
isEmailAddress([textField])
```

### Is Empty

Checks if a text field is empty and returns a Boolean.  If the field is not empty, it returns `false`.

```
isEmpty([textField])
```

### Is Equal To (with Text)

Checks if a text field is equal to a specific string value and returns a Boolean. If they *are not* equal, it returns `false`.

```
[textField] == "[string]"
```

### Is Not Equal To (with Text)

Checks if a text field is different from a specific string value and returns a Boolean. If they *are* equal, it returns `false`.

```
[textField] != "[string]"
```

### Matches

Checks if a text field matches a specific string value or RegEx expression and returns a Boolean. If the field does not match the value, it returns `false`.

```
match([textField], "[string]")

match([textField], "[regex]")
```

### Old Value (with Text)

Retrieves the prior value for the specified text field. You can use the value with other functions and operators.

```
oldValue([textFieldName])
```

## Numeric Fields

Liferay provides the following operators and functions for Integer, Long Integer, Decimal, and Precision Decimal fields. You can use any of these fields as arguments. With some elements, you can also add numeric values to compare with the field's value (e.g., `123`, `3.1415`).

### Condition (with Numeric)

Checks if user input meets one or more conditions and returns a Boolean value. This function works like `if` statements. Each expression includes at least one `condition` (e.g., `numericFieldName == 10`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `numericFieldName == 10, numericFieldName != 100, true, false`).

```
condition([condition], [return-value])
```

### Contains (with Numeric)

Checks if a number field contains a specific numeric value and returns a Boolean. If the field *does not* contain the value, it returns `false`.

```
contains([numericField], [number])
```

### Does not Contain (with Numeric)

Checks if a number field contains a specific numeric value and returns a Boolean. If the field *does* contain the value, it returns `false`.

```
NOT(contains([numericField], [number]))
```

### Is Decimal

Checks if a number field is a decimal and returns a Boolean. If the field *is not* a decimal, it returns `false`.

```
isDecimal([numericField])
```

### Is Integer

Checks if a number field is an integer and returns a Boolean. If the field *is not* an integer, it returns `false`.

```
isInteger([numericField])
```

### Is Equal To (with Numeric)

Checks if a number field is equal to a specific numeric value and returns a Boolean. If they *are not* equal, it returns `false`.

```
[numericField] == [number]
```

### Is Not Equal To (with Numeric)

Checks if a number field is different from a specific numeric value and returns a Boolean. If they *are* equal, it returns `false`.

```
[numericField] != [number]
```

### Is Greater Than

Checks if a number field is greater than a specific numeric value and returns a Boolean. If the field *is not* greater, it returns `false`.

```
[numericField] > [number]
```

### Is Greater Than or Equal To

Checks if a number field is greater than or equal to a specific numeric value and returns a Boolean. If the field *is not* equal or greater, it returns `false`.

```
[numericField] >= [number]
```

### Is Less Than

Checks if a number field is less than a specific numeric value and returns a Boolean. If the field *is not* less, it returns `false`.

```
[numericField] < [number]
```

### Is Less Than Or Equal To

Checks if a number field is less than or equal to a specific numeric value and returns a Boolean. If the field *is not* equal or less, it returns `false`.

```
[numericField] <= [number]
```

### Old Value (with Numeric)

Retrieves the prior value for the specified numeric field. You can use the value with other functions and operators.

```
oldValue([numericField])
```

### Sum

Adds multiple numeric fields together and returns a single number that can be used with other validation functions.

```
sum([numericField], [numericField])
```

## Date Fields

Liferay provides the following operators and functions for Date fields. You can use any Date field as an argument or parameter. Additionally, you can enter fixed date values (`"yyyy-MM-dd"`) for comparing with your date field (e.g., `2020-03-19`).

### Compare Dates

Checks if a date field's value is the same as the parameter. If the field does not match the parameter, it returns `false`.

```
compareDates([dateField], [parameter])
```

### Condition (with Date)

Checks if user input meets one or more conditions and returns a Boolean value. This function works like `if` statements. Each expression includes at least one `condition` (e.g., `dateFieldName == 2020-01-01`) and returns `true` or `false`. You can add multiple conditions to the same expression and determine a return value if none of the conditions are met (e.g., `dateFieldName == 2020-01-01, dateFieldName != 2022-01-01, true, false`). <!--TASK: Update Example-->

```
condition([condition], [return-value])
```

### Future Dates

Checks if a date field's value is equal to or after a set parameter. If it *is not*, the function returns `false`.

```
futureDates([dateField], [parameter])
```

For example,

```
futureDates(endDate, startDate)
```

```
futureDates(endDate, "2024-01-01")
```

The first example checks whether the `endDate` is equal to or after the `startDate` value. The second example checks whether the `endDate` value is equal to or after `2024-01-01`.

### Old Value (with Date)

Retrieves the prior value for the specified date field. You can use the value with other functions and operators.

```
oldValue([dateField])
```

### Past Dates

Checks if a date field's value is equal to or before a set parameter. If it *is not*, the function returns `false`.

```
pastDates([dateField], [parameter])
```

For example,

```
pastDates(startDate, endDate)
```

```
pastDates(startDate, "2024-01-01")
```

The first example checks whether the `startDate` is equal to or before the `endDate` value. The second checks whether the `startDate` value is equal to or before `2024-01-01`.

### Range

Checks whether date field values begin with a past date and end with a future date. If the dates *are not* within the range, it returns `false`.

```
futureDates([dateField], [parameter])
AND
pastDates([dateField], [parameter])
```

For example,

```
futureDates(endDate, startDate)
AND
pastDates(startDate, endDate)
```

This checks whether the `endDate` value is equal to/after the `startDate` value and whether the `startDate` value is equal to/before the `endDate` value.

## Math Operators

You can use any of the following math operators with numeric fields.

### Plus ( `+` )

Adds numeric fields to create an expression.

```
[numericField] + [numericField]
```

### Minus ( `-` )

Subtracts numeric fields from one another to create an expression.

```
[numericField] - [numericField]
```

### Divided By ( `/` )

Divides one numeric field by another to create an expression.

```
[numericField] / [numericField]
```

### Multiply ( `*` )

Multiplies numeric fields to create an expression.

```
[numericField] * [numericField]
```

## Logical Operators

Logical operators are used with multiple elements to aggregate complex conditions from multiple elements. Currently, Expression Builder validations provide the `AND` and `OR` operators.

* `AND`: Indicates a dependent relationship.

* `OR`: Indicates an independent relationship.

In the following example, the `AND` clauses are dependent on each other and must be taken together. By contrast, the `OR` clauses are logically separate and not co-dependent on each other.

```
match([phoneNumberField], "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
AND match([nameField], "[A-Za-z]{1,50}")
AND match([addressField], "[A-Za-z]{1,50}")
OR [numericField] == 1
OR match([lastNameField], "[A-Za-z]{1,50}")
```

## Validation Examples

The following validations are common examples. To use them, replace `fieldName` with the name of the field to validate.

### Name Validation (with Text)

Restricts values to alphabetic characters and limits the number of allowed characters.

```
match(fieldName, "[A-Za-z]{1,50}")
```

Allows for numbers in last names.

```
match(fieldName, "[A-Za-z][0-9]{1,50}")
```

### Password (with Text)

Checks if entries meet the following password criteria:

* At least 8 characters
* At least 5 unique characters
* At least 1 symbol
* At least 1 number
* No spaces allowed

```
match(fieldName, "^(?=.*[A-Za-z])(?=.*d)(?=.*[@$!%*#?&])[A-Za-zd@$!%*#?&]{8,}$")
```

### Cell Phone Number (with Numeric)

Checks if entries match a phone number pattern. It restricts entries to numeric characters, limits the number of characters, and sets a standard phone number pattern.

```
match(fieldName, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### Postal Code (with Numeric)

Checks if entries match a postal code pattern. It restricts entries to numeric characters, limits the number of characters, and sets a standard postal code pattern.

```
match(fieldName, "^([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}$")
```

### Specify Age Range (Date)

Checks if entries are between 18-65.

```
pastDates(fieldName, startsFrom, responseDate, years, -120, endsOn, responseDate, years, -18)
AND
futureDates(fieldName, startsFrom, responseDate, years, 0, endsOn, responseDate, years, 65)
```

## Related Topics

* [Creating Objects](../creating-objects.md)
* [Adding Fields to Objects](../fields/adding-fields-to-objects.md)
* [Adding Field Validations](../validations/adding-field-validations.md)
