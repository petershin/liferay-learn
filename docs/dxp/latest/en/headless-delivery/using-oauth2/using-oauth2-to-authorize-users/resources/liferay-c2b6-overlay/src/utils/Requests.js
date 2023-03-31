export const getAuthToken = async ({clientId, clientSecret, code, grantType, password, tokenUrl, username}) => {
	let redirectUri = window.location.href;

	if (redirectUri.lastIndexOf('?') > 0) {
		redirectUri = redirectUri.slice(0, redirectUri.lastIndexOf('?'));
	}

	const request = {
		client_id: clientId,
		client_secret: clientSecret,
		code: code,
		grant_type: grantType,
		password: password,
		redirect_uri: redirectUri,
		username: username,
	};

	let formBody = [];
	for (let property in request) {
		var encodedKey = encodeURIComponent(property);
		var encodedValue = encodeURIComponent(request[property]);
		formBody.push(encodedKey + '=' + encodedValue);
	}
	formBody = formBody.join('&');

	const data = await fetch(tokenUrl, {
		body: formBody,
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded',
		},
		method: 'POST',
	}).then(response => response.json());

	return data;
};

export const getUsers = async ({token, url}) => {
	return fetch(
		url,
		{
			headers: {
				'Authorization': 'Bearer ' + token,
				'Content-Type': 'application/json',
			},
			method: 'GET',
		}
	);
};
