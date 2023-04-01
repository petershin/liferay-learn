import React from 'react';

import {getAuthToken} from '../utils/Requests';

function Token({handleToken, grantType}) {
	const [clientId, setClientId] = React.useState('');
	const [clientSecret, setClientSecret] = React.useState('');
	const [password, setPassword] = React.useState('');
	const [tokenUrl, setTokenUrl] = React.useState('');
	const [username, setUsername] = React.useState('');

	async function handleGetToken() {
		const token = await getAuthToken({clientId, clientSecret, grantType, password, tokenUrl, username});

		handleToken(token);
	}

	return (
		<div className='Token'>
			<h2>Get Token</h2>

			<input
				onChange={(event) => setTokenUrl(event.target.value)}
				placeholder="Liferay Token URL"
				style={{width: 500}}
				type="text"
				value={tokenUrl}
			/>

			(e.g. http://localhost:8080/o/oauth2/token)

			<br />

			<input
				onChange={(event) => setClientId(event.target.value)}
				placeholder="Client ID"
				style={{width: 500}}
				type="text"
				value={clientId}
			/>

			<br />

			<input
				onChange={(event) => setClientSecret(event.target.value)}
				placeholder="Client Secret"
				style={{width: 500}}
				type="text"
				value={clientSecret}
			/>

			<br />

			{grantType === 'password' && (
				<div>
					<input
						onChange={(client) => setUsername(client.target.value)}
						placeholder="User Name"
						style={{width: 500}}
						type="text"
						value={username}
					/>

					<br />

					<input
						onChange={(client) =>
							setPassword(client.target.value)
						}
						placeholder="User Password"
						style={{width: 500}}
						type="text"
						value={password}
					/>

					<br />
				</div>
			)}

			<button onClick={handleGetToken}>Get Token</button>
		</div>
	);
}

export default Token;
