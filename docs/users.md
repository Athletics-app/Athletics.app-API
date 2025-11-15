# Users

## `GET` /users/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No            | athletics.app |

### Description

Retrieve all users.


### Body

_None_

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationality": "NL",
  "club": "Path:../clubs/clubget.json"
}
```

## `POST` /users/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | No            | athletics.app |

### Description

Create a new user.

### Body

Path: dto/users/userpost.json
```json
{
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationalityId": "NL",
  "clubId": "CLUBID"
}
```

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationality": "NL",
  "club": "Path:../clubs/clubget.json"
}
```

## `GET` /users/{user_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Retrieve a specific user by ID.

### Body

_None_

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationality": "NL",
  "club": "Path:../clubs/clubget.json"
}
```

## `PUT` /users/{user_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes           | athletics.app |

### Description

Update a specific user by ID.

### Body

Path: dto/users/userpost.json
```json
{
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationalityId": "NL",
  "clubId": "CLUBID"
}
```

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationality": "NL",
  "club": "Path:../clubs/clubget.json"
}
```

## `DELETE` /users/{user_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes (Bearer)  | athletics.app |

### Description

Delete a specific user by ID.

### Body

_None_

### Response

```json
{ "message": "User deleted successfully." }
```

## `GET` /users/{user_id}/profile

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Retrieve a personal user info by ID.

### Body

_None_

### Response

Path: dto/users/userprofileget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "firstName": "John",
  "lastName": "Doe",
  "birthDate": "2025-11-30",
  "nationality": "BE",
  "language": "BE",
  "gender": "MALE",
  "athleteLicense": "Path:../athletes/athleteLicenseget.json",
  "club": "Path:../clubs/clubget.json",
  "competitions": "Path:../users/usercompetitionsget.json"
}
```

## `PUT` /users/{user_id}/profile

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes           | athletics.app |

### Description

Update personal user info by ID.

### Body

TODO

### Response

TODO

## `GET` /users/{user_id}/preferences

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

User settings / preferences

### Body

_None_

### Response

TODO

## `PUT` /users/{user_id}/preferences

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes           | athletics.app |

### Description

Update user settings / preferences

### Body

TODO

### Response

TODO

## `GET` /users/{user_id}/media

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Download user media

### Body

_None_

### Response

TODO

## `POST` /users/{user_id}/media

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes           | athletics.app |

### Description

Upload user media

### Body

TODO

### Response

TODO
