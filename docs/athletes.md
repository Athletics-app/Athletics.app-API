# Athletes

## `GET` /athletes/{athlete_id}/results

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `GET`  | TODO            | Victor, Jules     |

### Description

Retrieve all competition results for a specific athlete.

### Query parameters

- `?season` (integer) - optional, filter by athletics season
- `?discipline` (string) - optional, e.g. `100m`, `Javelin`
- `?location` (string) - optional, filter by city/venue
- `?date_from` (date) - optional, include results on/after this date (`YYYY-MM-DD`)
- `?date_to` (date) - optional, include results on/before this date (`YYYY-MM-DD`)
- `?page` (integer) - optional, page number (starting at 1)
- `?limit` (integer) - optional, max number of results per page
- `?sort` (string) - optional, sorting method (e.g. `date_asc`, `date_desc`)

### Body

_None_

### Response

Path: dto/athletes/athleteresultsget.json
```json
{
  "items": [
    {
      "event_id": "NK2025",
      "event_name": "ASICS NK Atletiek 2025",
      "discipline": "100m",
      "performance": "10.55",
      "unit": "sec",
      "wind": "+1.2",
      "rank": 2,
      "date": "2025-07-26",
      "location": "Hengelo"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 25,
    "total_items": 142,
    "total_pages": 6
  }
}
```

## `GET` /athletes/{athlete_id}/records/

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `GET`  | TODO          | Victor      |

### Description

Personal records, season records, club records

### Body

_None_

### Response

TODO

## `GET` /athletes/{athlete_id}/events/

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `GET`  | TODO          | Victor      |

### Description

Competitions for which the athlete is registered or has participated

### Body

_None_

### Response

TODO
