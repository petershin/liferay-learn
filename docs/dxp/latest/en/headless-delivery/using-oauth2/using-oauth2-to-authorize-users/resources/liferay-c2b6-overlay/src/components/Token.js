import React from 'react';

import {getAuthToken} from '../utils/Requests';

export function Token({handleToken, code, grantType}) {
	const [clientId, setClientId] = React.useState('');
	const [clientSecret, setClientSecret] = React.useState('');
	const [password, setPassword] = React.useState('');
	const [username, setUsername] = React.useState('');

	async function handleGetToken() {
		const token = await getAuthToken({clientId, clientSecret, code, grantType, password, username});

		handleToken(token);
	}

	return (
		<div className='Token'>
			<h2>Get Token</h2>

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
