import React from 'react';

import {getUsers} from '../utils/Requests';

function Users({token}) {
	const [url, setUrl] = React.useState('');
	const [users, setUsers] = React.useState([]);

	const handleGetUsers = async () => {
		await getUsers({token, url})
			.then(response => response.json())
			.then(data => setUsers(data.items));
	};

	return (
		<div>
			<h2>Get Data</h2>

			<input
				onChange={(event) => setUrl(event.target.value)}
				placeholder="Liferay Request URL"
				style={{width: 500}}
				type="text"
				value={url}
			/>

			(e.g. http://localhost:8080/o/headless-admin-user/v1.0/user-accounts)

			<br />

			<button onClick={handleGetUsers}>Get Data</button>

			<pre>{JSON.stringify(users, null, 2)}</pre>
		</div>
	);
}

export default Users;
