# Notifications

## `GET` /notifications

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

List of notifications

### Body

_None_

### Response

Path: dto/notification/notificationget.json

## `GET` /notifications/{notification_id}

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `GET`  | Yes           | athletics.app |

### Description

Specific notification

### Body

_None_

### Response

Path: dto/notification/notificationget.json

## `PUT` /notifications/{notification_id}

| Method | Authorisation | Contributor   |
| ------ | ------------- | ------------- |
| `PUT` | Yes           | athletics.app |

### Description

Change status of a notification

### Body

_None_

### Response

Path: dto/notification/notificationget.json

## `DELETE` /notifications/{notification_id}

| Method   | Authorisation | Contributor   |
| -------- | ------------- | ------------- |
| `DELETE` | Yes           | athletics.app |

### Description

Delete a notification

### Body

_None_

### Response

```json
{ "message": "Notification deleted successfully." }
```