---
name: New Endpoint Request
about: Request a new API endpoint to be designed.
title: "[New Endpoint] <short description>"
labels: api-design, needs-review
assignees: RecourVictor
---

## 🧠 Before You Start

Please use this form **only if you do not have API design experience**.  
Victor will review your request and create the endpoint based on your description.

---

### 🧩 Related Resource
_What resource is this endpoint related to? (e.g. users, competitions, clubs)_

> Example: `competitions`

---

### 🎯 Endpoint Purpose
_Describe what this endpoint should do — what’s the goal, what data does it handle, and why is it needed?_

> Example: Allow clubs to fetch all athletes registered for a given weekend.

---

### 🧾 HTTP Method
_Select the correct HTTP method._

- [ ] `GET`
- [ ] `POST`
- [ ] `PUT`
- [ ] `DELETE`

---

### 🌐 Example Endpoint Path
_If you have an idea of what the path could look like, include it here._

> Example: `/clubs/{club_id}/registrations`

---

### 📦 Expected Request Body (optional)
_If this endpoint accepts input data, describe it below (in JSON if possible)._

```json
{
  "club_id": 123,
  "athletes": [1, 2, 3]
}
```
---

### 📤 Expected Response (optional)

_If you know what kind of response this should return, show an example (in JSON)._

```json
{
  "status": "success",
  "registered_athletes": [...]
}
```
---

### 📝 Additional Notes

_Anything else you want to mention?_
