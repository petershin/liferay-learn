import { useState } from 'react';

import { getUsers } from '../utils/Requests';

function Users({ token }) {
  const [users, setUsers] = useState([]);

  const handleGetUsers = async () => {
    const data = await getUsers(token.access_token)
      .then((response) => response.json())
      .then((data) => setUsers(data.items));
  };

  return (
    <div>
      <h2>List of Users</h2>

      <button onClick={handleGetUsers}>Get Users</button>

      {users.map((items) => (
        <div key={items.id}>
          {items.givenName} {items.familyName} {items.emailAddress}
        </div>
      ))}
    </div>
  );
}

export default Users;
