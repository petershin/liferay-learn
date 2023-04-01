import React from 'react';

import Authorize from '../../components/Authorize';
import Token from '../../components/Token';
import Users from '../../components/Users';

function AuthorizationCode() {
	const [token, setToken] = React.useState({});

	function handleToken(token) {
		setToken(token);
	}

	return (
		<div>
			<h1>Authorization Code Flow</h1>

			Callback URI: http://localhost:3000/grant-type-authorization-code (or wherever the React app is running)

			<br />

			Scope: Headless Admin User (e.g. Liferay.Headless.Admin.User.everything.read)

			<br />

			CORS: Configure Portal CORS URL Pattern (e.g. /o/headless-admin-user/*)

			<Authorize />

			<Token
				grantType='authorization_code'
				handleToken={handleToken}
			/>

			<Users token={token} />
		</div>
	);
}

export default AuthorizationCode;
