import React, { useState } from 'react';

import Token from './components/Token';
import Users from './components/Users';

function Password() {
  const [token, setToken] = useState({});

  function handleToken(token) {
    setToken(token);
  }

  return (
    <div>
      <h1>Password Flow</h1>

      <Token handleToken={handleToken} />

      <Users token={token} />
    </div>
  );
}

export default Password;
