# Athletics.app API

# HTTP Methods Legend

| Method  | Description |
|---------|-------------|
| `GET`   | Retrieve data. Use this method to request information from the server without making any changes. |
| `POST`  | Create new data. Use this method to create a new item or record. |
| `PUT`   | Update existing data. Use this method to fully update an existing item. |
| `DELETE`| Delete data. Use this method to remove an item from the server. |



# Endpoint `auth`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /auth/login/                            | `POST`                 | Login user, returns token                             |
| /auth/logout/                           | `POST`                 | Logout user                                          |
| /auth/refresh/                          | `POST`                 | Refresh auth token                                   |

# Endpoint `users`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /users/                                 | `GET` `POST`           | List of users / create new user                     |
| /users/{user_id}/                        | `GET` `PUT` `DELETE`  | Specific user                                       |
| /users/{user_id}/profile/               | `GET` `PUT`            | Personal profile information                         |
| /users/{user_id}/preferences/           | `GET` `PUT`            | User settings / preferences                          |
| /users/{user_id}/media/                 | `GET` `POST`           | Upload/download user media                           |
| /users/{user_id}/media/{media_id}/      | `GET` `DELETE`         | Individual media file                                |

# Endpoint `clubs`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /clubs/                                 | `GET` `POST`           | List of clubs / create new club                      |
| /clubs/{club_id}/                        | `GET` `PUT` `DELETE`  | Club details                                         |
| /clubs/{club_id}/members/               | `GET` `POST`           | Club members                                        |
| /clubs/{club_id}/members/{user_id}/     | `GET` `DELETE`         | Specific member                                     |

# Endpoint `competitions`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /competitions/                          | `GET` `POST`           | List of competitions / create new competition      |
| /competitions/{competition_id}/         | `GET` `PUT` `DELETE`  | Specific competition                                 |
| /competitions/{competition_id}/categories/ | `GET` `POST`        | Categories within a competition                     |
| /competitions/{competition_id}/categories/{category_id}/ | `GET` `PUT` `DELETE` | Specific category                             |
| /competitions/{competition_id}/categories/{category_id}/events/ | `GET` `POST` | Events within a category                       |
| /competitions/{competition_id}/categories/{category_id}/events/{event_id}/ | `GET` `PUT` `DELETE` | Specific event                                |
| /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/ | `GET` `POST` | Event results                                 |
| /competitions/{competition_id}/categories/{category_id}/events/{event_id}/results/{result_id}/ | `GET` `PUT` `DELETE` | Individual result                          |
| /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/ | `GET` `POST` | Event participants                             |
| /competitions/{competition_id}/categories/{category_id}/events/{event_id}/participants/{competitor_id}/ | `GET` `DELETE` | Specific participant                         |
| /competitions/{competition_id}/competitors/ | `GET` `POST`         | List of competitors / create new competitor        |
| /competitions/{competition_id}/competitors/{competitor_id}/ | `GET` `PUT` `DELETE` | Specific competitor                           |
| /competitions/{competition_id}/competitors/{competitor_id}/history/ | `GET` | Historical results                               |
| /competitions/{competition_id}/rankings/ | `GET`                 | Competition rankings                                |

# Endpoint `teams`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /teams/                                 | `GET` `POST`           | Teams within clubs or competitions                  |
| /teams/{team_id}/                        | `GET` `PUT` `DELETE`  | Team details                                         |
| /teams/{team_id}/members/               | `GET` `POST`           | Team members                                        |
| /teams/{team_id}/members/{user_id}/     | `GET` `DELETE`         | Individual team member                               |

# Endpoint `media`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /media/                                 | `GET` `POST`           | General media upload/download                        |
| /media/{media_id}/                       | `GET` `DELETE`         | Individual media file                                |

# Endpoint `stats`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /stats/                                 | `GET`                  | General statistics / dashboards                     |
| /stats/competitions/                     | `GET`                  | Competition statistics                               |
| /stats/users/                            | `GET`                  | User statistics                                      |
| /stats/clubs/                            | `GET`                  | Club statistics                                      |

# Endpoint `notifications`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /notifications/                          | `GET` `POST`           | List of notifications / create new notification     |
| /notifications/{notification_id}/        | `GET` `PUT` `DELETE`  | Specific notification                                 |

# Endpoint `search`

| Endpoint                                | Method                  | Description                                           |
|----------------------------------------|------------------------|------------------------------------------------------|
| /search/                                 | `GET`                  | Search across competitions, events, users           |




```mermaid
graph TD
  competitions --> categories
  competitions --> competitors
  categories --> events
  competitors --> history
