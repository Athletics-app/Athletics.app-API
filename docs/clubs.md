# Clubs

## `GET` /clubs/

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `GET`  | No            | Atheltics.app, Victor |

### Description

Retrieve all clubs.

### Body

_None_

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

## `POST` /clubs/

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `POST` | Yes           | Atheltics.app, Victor |

### Description

Create a club.

> @athletics.app do we need this as a public api call?

### Body

Path: dto/clubs/clubpost.json
```json
{
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

## `GET` /clubs/{club_id}

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `GET`  | No            | Atheltics.app, Victor |

### Description

Retrieve a specific club.

### Body

_None_

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

## `PUT` /clubs/{club_id}

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `PUT`  | Yes           | Atheltics.app, Victor |

### Description

Update a specific club. (Only for clubadmins)

### Body

Path: dto/clubs/clubpost.json
```json
{
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "short_name": "DN",
  "country": "NL",
  "city": "Brussels",
  "email": "DN@atletiek.be"
}
```

## `DELETE` /clubs/{club_id}

| Method   | Authorisation | Contributor           |
| -------- | ------------- | --------------------- |
| `DELETE` | Yes           | Atheltics.app, Victor |

### Description

Delate a specific club.

> @athletics.app do we need this as a public api call?

### Body

_None_

### Response

```json
{ "message": "Club deleted successfully." }
```

## `GET` /clubs/{club_id}/members

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `GET`  | No            | Victor      |

### Description

Retrieve all member from a specific club.

### Body

_None_

### Response

Path: dto/athletes/athleteget.json
```json
{
  "name": "John",
  "last_name": "Doe",
  "club": {
    "id": "ID",
    "name": "demo name",
    "short_name": "DN",
    "country": "NL",
    "city": "Brussels",
    "email": "DN@atletiek.be"
  },
  "nationality": {
    "ISO": "BE",
    "Description": "Belgian",
    "Flag": "URLTOFLAGIMAGE"
  },
  "age": 22,
  "speciality": [
    "100m",
    "200m",
    "TODO MAKE DTO"
  ],
  "bib_number": 123,
  "personal_bests": "Path/personalbestget.json",
  "seasons_bests": "Path/personalbestget.json",
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

## `GET` /clubs/{club_id}/startdate/{start_date}/enddate/{end_date}

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `GET`  | No            | Victor      |

### Description

Registered athletes or results of athletes from a club with start and end dates

### Body

_None_

### Response

TODO @RecourVictor create a dto for this
