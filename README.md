## User Mood Service
- User Mood Service API serves as a service to Brain Food Organization. This service saves user's mood information once they make a request for the recipe service. This mood is saved and then shown to the user to serve as a tracker for their mood information.

## Setup

### Prerequisites
- Ruby (version >= 2.5.0)
- Rails (version >= 5.2.0)
- PostgreSQL

### Installation
1. Clone the repository:

    ```bash
    git clone <repository_url>
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:setup
    ```

## Usage
- Start the server:

    ```bash
    rails server
    ```

- Access the API endpoints via http://localhost:3000/api/v1/

## Endpoints

### GET /api/v1/moods?user_id=<user_id>
response: 
```json
{
    "data": {
        "id": 1,
        "type": "user_mood",
        "attributes": {
            "avg_mood": 3.0,
            "user_moods": [
                {
                    "date": "2024-05-16T00:00:00.000Z",
                    "mood": 3
                }
            ]
        }
    }
}
```

#### Edge cases:
 - In case there are no moods for a user, this is the response:
 ```json
 {
    "data": {
        "id": 1,
        "type": "user_mood",
        "attributes": {
            "avg_mood": 0.0,
            "user_moods": []
        }
    }
}
```

 - If no User ID passed on the query:
 ```json
 {
    "errors": [
        {
            "detail": "User ID not provided in request query. Please include a user_id"
        }
    ]
}
```

### POST /api/v1/moods
- Request Body:
```json
{
    "user_id": 1,
    "mood": 3
}
```

- Response: No Content, status 201.

#### Edge Cases:
- If no User Id passed:
  - Request Body:
    ```json
    {
    "mood": 3
    }
    ```
  
  - Response Body:
    ```json
    {
        "errors": [
            {
                "detail": "Validation failed: User can't be blank, User is not a number"
            }
        ]
    }
    ```
- If no Mood passed:
  - Request Body:
    ```json
    {
    "user_id": 3
    }
    ```
  
  - Response Body:
    ```json
    {
        "errors": [
            {
                "detail": "Validation failed: Mood can't be blank, Mood is not a number"
            }
        ]
    }
    ```

## Production Site: 
[Brain Food Gatewat](https://user-moods-rails.onrender.com/)

## Testing
This project includes automated tests written with RSpec. To run the tests, execute the following command:

```bash
bundle exec rspec
```

## Contributors
- Erin Kelley
    - [LinkedIn](https://www.linkedin.com/in/kelleyej/) | [GitHub](https://github.com/kelleyej)
- Faisal Nazari
    - [LinkedIn](https://www.linkedin.com/in/mfaisalnazari/) | [GitHub](https://github.com/mfaisalnazari)
- Igor Magalhaes
    - [LinkedIn](https://www.linkedin.com/in/igorrmagalhaess/) | [GitHub](https://github.com/IgorrMagalhaess) 
- Jack Sweeney
    - [LinkedIn](https://www.linkedin.com/in/jack-sweeney-024043274/) | [GitHub](https://github.com/JackCSweeney)
- Laura Long
    - [LinkedIn](https://www.linkedin.com/in/lauralonggone/) | [GitHub](https://github.com/lalonggone)

## Contributing
Contributions are welcome! Feel free to open issues or pull requests.

## License
This project is licensed under the MIT License.

