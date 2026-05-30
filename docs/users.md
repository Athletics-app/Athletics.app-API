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
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  }
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
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality_id": "NL",
  "club_id": "CLUBID",
  "password": "123456789"
}
```

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  }
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
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  }
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
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality_id": "NL",
  "club_id": "CLUBID",
  "password": "123456789"
}
```

### Response

Path: dto/users/userget.json
```json
{
  "id": "ID",
  "email": "john.doe@gmail.com",
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  }
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
  "first_name": "John",
  "last_name": "Doe",
  "birth_date": "2025-11-30",
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "gender": "MALE",
  "language": {
    "ISO": "nl-BE",
    "Decription": "Vlaams"
  },
  "athlete_license": {
    "federation": "VAL",
    "start_date": "01-11-2025",
    "end_date": "31-10-2026",
    "bib_number": 123
  },
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  },
  "competitions": {
    "name": "Avondmeeting",
    "start_time": "10-10-2025-14:00",
    "end_time": "10-10-2025-18:00",
    "organizer": "Belgian Athletics",
    "bib_number": 123,
    "first_name": "John",
    "last_name": "Doe",
    "club": {
      "id": "ID",
      "name": "demo name",
      "short_name": "DN",
      "country": "NL",
      "city": "Brussels",
      "email": "DN@atletiek.be"
    },
    "category": "SEN",
    "disciplines": "TODO"
  }
}
```

## `GET` /users/{user_id}/preferences

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app, RecourVictor |

### Description

User settings / preferences

### Body

_None_

### Response

Path: dto/users/userpreferencesget.json
```json
{
  "language": {
    "ISO": "nl-BE",
    "Decription": "Vlaams"
  }
}
```

## `PUT` /users/{user_id}/preferences

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes           | athletics.app |

### Description

Update user settings / preferences

### Body

Path: dto/users/userpreferencespost.json
```json
{
  "language_id": "NL"
}
```

### Response

Path: dto/users/userpreferencesget.json
```json
{
  "language": {
    "ISO": "nl-BE",
    "Decription": "Vlaams"
  }
}
```

## `GET` /users/{user_id}/media

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Download user media

### Body

_None_

### Response

Path: dto/media/mediaget.json
```json
{
  "id": "id",
  "uploaded_on": "2025-11-28 20:22",
  "media_url": "URLTOMEDIA",
  "file_type": ".png"
}
```

## `POST` /users/{user_id}/media

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes           | athletics.app |

### Description

Upload user media

### Body

Filestream

### Response

Path: dto/media/mediaget.json
```json
{
  "id": "id",
  "uploaded_on": "2025-11-28 20:22",
  "media_url": "URLTOMEDIA",
  "file_type": ".png"
}
```

## `GET` /users/{user_id}/media/{media_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Download specific user media

### Body

_None_

### Response

Path: dto/media/mediaget.json
```json
{
  "id": "id",
  "uploaded_on": "2025-11-28 20:22",
  "media_url": "URLTOMEDIA",
  "file_type": ".png"
}
```

## `DELETE` /users/{user_id}/media{media_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `DELETE` | Yes           | athletics.app |

### Description

Delete individual media file

### Body

_None_

### Response

```json
{ "message": "Media deleted successfully." }
```
