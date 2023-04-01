import React from 'react';

import Token from '../../components/Token';
import Users from '../../components/Users';

function Password() {
	const [token, setToken] = React.useState({});

	function handleToken(token) {
		setToken(token);
	}

	return (
		<div>
			<h1>Password Flow</h1>

			Scope: Headless Admin User (e.g. Liferay.Headless.Admin.User.everything.read)

			<br />

			CORS: Configure Portal CORS URL Pattern (e.g. /o/headless-admin-user/*)

			<Token
				grantType='password'
				handleToken={handleToken}
			/>

			<Users token={token} />
		</div>
	);
}

export default Password;
