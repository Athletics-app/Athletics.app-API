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
  "shortName": "DN",
  "country": "NL"
}
```

## `POST` /clubs/

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `POST` | Yes           | Atheltics.app, Victor |

### Description

Create a club.

### Body

Path: dto/clubs/clubpost.json
```json
{
  "name": "demo name",
  "shortName": "DN",
  "country": "NL"
}
```

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "shortName": "DN",
  "country": "NL"
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
  "shortName": "DN",
  "country": "NL"
}
```

## `PUT` /clubs/{club_id}

| Method | Authorisation | Contributor           |
| ------ | ------------- | --------------------- |
| `PUT`  | Yes           | Atheltics.app, Victor |

### Description

Update a specific club.

### Body

Path: dto/clubs/clubpost.json
```json
{
  "name": "demo name",
  "shortName": "DN",
  "country": "NL"
}
```

### Response

Path: dto/clubs/clubget.json
```json
{
  "id": "ID",
  "name": "demo name",
  "shortName": "DN",
  "country": "NL"
}
```

## `DELETE` /clubs/{club_id}

| Method   | Authorisation | Contributor           |
| -------- | ------------- | --------------------- |
| `DELETE` | Yes           | Atheltics.app, Victor |

### Description

Delate a specific club.

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
  "lastName": "Doe",
  "TODO": "expand this dto"
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
