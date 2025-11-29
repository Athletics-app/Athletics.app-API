# Competitions

## `GET` /competitions/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List of competitions

### Body

_None_

### Response

TODO

## `POST` /competitions/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new competition

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve specific competition

### Body

_None_

### Response

Path: dto/competitions/competitionsget.json
```json
{
  "id": "123",
  "name": "Avondmeeting",
  "date": "2025-11-28",
  "country": "BE",
  "city": "Brussels",
  "startTime": "13:50",
  "endTime": "17:30",
  "adress": "Brusselstraat 25, 1000 Brussel",
  "email": "example@gmail.com",
  "phone": "+32 0412 34 56",
  "participants": 154,
  "startDateRegistrations": "2025-11-28 12:00",
  "endDateRegistrations": "2025-11-28 23:59",
  "description": "HTML SUPPORTED DESCRIPTION",
  "TODO": "TODO EXPAND THIS DTO"
}
```

## `PUT` /competitions/{competition_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update specific competition

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete specific competition

### Body

_None_

### Response

```json
{ "message": "Competition deleted successfully." }
```

## `GET` /competitions/{competition_id}/categories/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List categories within a competition

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/categories/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new category within a competition

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/categories/{category_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve specific category

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/categories/{category_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update specific category

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/categories/{category_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete specific category

### Body

_None_

### Response

```json
{ "message": "Category for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/categories/{category_id}/events/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List events within a category

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/categories/{category_id}/events/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new event within a category

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve specific event

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update specific event

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete specific event

### Body

_None_

### Response

```json
{ "message": "Event for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List event results

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new event result

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/{result_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve individual result

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/{result_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update individual result

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/{result_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete individual result

### Body

_None_

### Response

```json
{ "message": "Result for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

List event participants

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Add event participant

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/{competitor_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve specific participant

### Body

_None_

### Response

TODO

## `DELETE` /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/{competitor_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Remove specific participant

### Body

_None_

### Response

```json
{ "message": "Participant for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/registration/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Registration overview

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/registration/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new registration

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/registration/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Retrieve online entry settings, maximum # of athletes, available bib numbers

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/registration/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update online entry settings, maximum # of athletes, available bib numbers

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/registration/discounts/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

List discounts & codes

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/registration/discounts/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new discount or code

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/registration/payments/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Payment overview

### Body

_None_

### Response

TODO

## `GET` /competitions/{competition_id}/timetable/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve timetable

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/timetable/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update timetable management

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/results/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Retrieve results settings

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/results/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update results settings

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/leaderboard/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Retrieve leaderboard settings

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/leaderboard/settings/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update leaderboard settings

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/print/diplomas/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Get a PDF file of diplomas

### Body

_None_

### Response

TODO - PDF file (@TODO: this endpoint requires defining parameters)

## `GET` /competitions/{competition_id}/print/startlists/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Get a PDF file of startlists

### Body

_None_

### Response

TODO - PDF file (@TODO: this endpoint requires defining parameters)

## `GET` /competitions/{competition_id}/print/bib-labels/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Get a PDF file of bib labels

### Body

_None_

### Response

TODO - PDF file

## `GET` /competitions/{competition_id}/print/results/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Get a PDF file of results

### Body

_None_

### Response

TODO - PDF file (@TODO: this endpoint requires defining parameters)

## `GET` /competitions/{competition_id}/enter/results/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Enter results manually

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/enter/results/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Enter results manually

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/enter/results/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete manually entered results

### Body

_None_

### Response

```json
{ "message": "Result for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/narrowcasting/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Narrowcasting displays (@TODO: this needs a lot more endpoints, to link screens, etc)

### Body

_None_

### Response

TODO

## `GET` /competitions/{competition_id}/clubs/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Clubs participating in the competition

### Body

_None_

### Response

TODO

## `GET` /competitions/{competition_id}/permissions/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

Retrieve rights management (who can edit/view what)

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/permissions/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update rights management (who can edit/view what)

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/permissions/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete rights management entry

### Body

_None_

### Response

```json
{ "message": "Permition for competition {competition-id} deleted successfully." }
```

## `POST` /competitions/{competition_id}/permissions/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new rights management entry (who can edit/view what)

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/competitors/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List of competitors

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/competitors/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new competitor

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/competitors/{competitor_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve specific competitor

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/competitors/{competitor_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update specific competitor

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/competitors/{competitor_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete specific competitor

### Body

_None_

### Response

```json
{ "message": "Competitor for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/competitors/{competitor_id}/history/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes          | athletics.app |

### Description

History of all changes made to this competitor

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/check-in/{athlete_id}

| Method | Authorisation | Contributor |
| ------ | ------------- | ----------- |
| `POST` | Yes          | Victor      |

### Description

Check in of athletes

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/teams/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List teams within a competition

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/teams/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new team within a competition

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/teams/{team_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve team details

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/teams/{team_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update team details

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/teams/{team_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete team

### Body

_None_

### Response

```json
{ "message": "Team for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/teams/{team_id}/members/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List team members

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/teams/{team_id}/members/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Add team member

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/teams/{team_id}/members/{user_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve individual team member (should we do this, or should we just query a competitor?)

### Body

_None_

### Response

TODO

## `DELETE` /competitions/{competition_id}/teams/{team_id}/members/{user_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Remove individual team member (should we do this, or should we just query a competitor?)

### Body

_None_

### Response

```json
{ "message": "Team member for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/relayteams/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List relay teams within a competition

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/relayteams/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Create new relay team within a competition

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/relayteams/{team_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve relay team details

### Body

_None_

### Response

TODO

## `PUT` /competitions/{competition_id}/relayteams/{team_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT`  | Yes          | athletics.app |

### Description

Update relay team details

### Body

TODO

### Response

TODO

## `DELETE` /competitions/{competition_id}/relayteams/{team_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Delete relay team

### Body

_None_

### Response

```json
{ "message": "Relay team for competition {competition-id} deleted successfully." }
```

## `GET` /competitions/{competition_id}/relayteams/{team_id}/members/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

List relay team members

### Body

_None_

### Response

TODO

## `POST` /competitions/{competition_id}/relayteams/{team_id}/members/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `POST` | Yes          | athletics.app |

### Description

Add relay team member

### Body

TODO

### Response

TODO

## `GET` /competitions/{competition_id}/relayteams/{team_id}/members/{user_id}/

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | No          | athletics.app |

### Description

Retrieve individual relay team member (should we do this, or should we just query a competitor?)

### Body

_None_

### Response

TODO

## `DELETE` /competitions/{competition_id}/relayteams/{team_id}/members/{user_id}/

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes          | athletics.app |

### Description

Remove individual relay team member (should we do this, or should we just query a competitor?)

### Body

_None_

### Response

```json
{ "message": "Relay team member for competition {competition-id} deleted successfully." }
```
