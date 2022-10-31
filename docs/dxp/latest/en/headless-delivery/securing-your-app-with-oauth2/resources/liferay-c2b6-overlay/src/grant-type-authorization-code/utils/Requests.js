import { clientId, clientSecret, redirectUri } from './config';

export const getAuthToken = async (code) => {
  const request = {
    client_id: clientId,
    client_secret: clientSecret,
    code: code,
    grant_type: 'authorization_code',
    redirect_uri: redirectUri,
  };

  let formBody = [];
  for (let property in request) {
    var encodedKey = encodeURIComponent(property);
    var encodedValue = encodeURIComponent(request[property]);
    formBody.push(encodedKey + '=' + encodedValue);
  }
  formBody = formBody.join('&');

  const data = await fetch(`http://localhost:8080/o/oauth2/token`, {
    body: formBody,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    method: 'POST',
  }).then((response) => response.json());

  return data;
};

export const getUsers = (token) => {
  return fetch(
    `http://localhost:8080/o/headless-admin-user/v1.0/user-accounts`,
    {
      headers: {
        Authorization: 'Bearer ' + token,
        'Content-Type': 'application/json',
      },
      method: 'GET',
    }
  );
};
