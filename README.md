# <div align="center">Sweater Weather</div>
![------------------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### <ins>Overview</ins>

Sweater Weather is a backend application that exposes a number of external APIs for a hypothetical front end app.

### Setup
1. Fork and Clone the repo
2. Install gem packages: `$ bundle install`
3. Setup the database: `$ rails db:{create,migrate}`

### API Setup
1. Sign up for API keys from the following:
*note* One API key will suffice for both MapQuest endpoints. The links provided will take you to the respective documentation pages where you can sign up to get an API key for your device.

- MapQuest Geocoding API [here](https://developer.mapquest.com/documentation/geocoding-api/)
- MapQuest Directions API [here](https://developer.mapquest.com/documentation/directions-api/)
- OpenWeather One Call API [here](https://openweathermap.org/api/one-call-api)
- Unsplash [here](https://unsplash.com/documentation#search-photos)

2. From the command line, run the following: `$ bundle exec figaro install`
3. In the command line, run `$ atom config/application.yml`
4. Copy the following code and replace 'YOUR-API-KEY' with their corresponding credentials:
  ```
  mapquest_key: 'YOUR-API-KEY'
  weather_key: 'YOUR-API-KEY'
  unsplash_key: 'YOUR-API-KEY'
  ```

#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />   
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  </br>
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>


  ![------------------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### Endpoints

#### Retrieve weather for a city:

*Request*

`GET /api/v1/forecast?location=denver,co`

*Response*

```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-07 22:32:53 -0700",
                "sunrise": "2022-06-07 04:32:14 -0700",
                "sunset": "2022-06-07 19:25:42 -0700",
                "temperature": 58.6,
                "feels_like": 57.16,
                "humidity": 64,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "2022-06-07",
                    "sunrise": "2022-06-07 04:32:14 -0700",
                    "sunset": "2022-06-07 19:25:42 -0700",
                    "max_temp": 80.56,
                    "min_temp": 55.71,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "date": "2022-06-08",
                    "sunrise": "2022-06-08 04:32:01 -0700",
                    "sunset": "2022-06-08 19:26:16 -0700",
                    "max_temp": 81.36,
                    "min_temp": 55.85,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-09",
                    "sunrise": "2022-06-09 04:31:51 -0700",
                    "sunset": "2022-06-09 19:26:49 -0700",
                    "max_temp": 90.37,
                    "min_temp": 63.5,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-06-10",
                    "sunrise": "2022-06-10 04:31:42 -0700",
                    "sunset": "2022-06-10 19:27:21 -0700",
                    "max_temp": 91.92,
                    "min_temp": 63.21,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "date": "2022-06-11",
                    "sunrise": "2022-06-11 04:31:35 -0700",
                    "sunset": "2022-06-11 19:27:50 -0700",
                    "max_temp": 92.66,
                    "min_temp": 69.24,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "22:00:00",
                    "temperature": 59.65,
                    "conditions": "light rain",
                    "icon": "10n"
                },
                {
                    "time": "23:00:00",
                    "temperature": 58.6,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "00:00:00",
                    "temperature": 58.62,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "01:00:00",
                    "temperature": 57.88,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "02:00:00",
                    "temperature": 57.29,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "03:00:00",
                    "temperature": 56.52,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 55.85,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 56.12,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```
#### Retrieve background image for a city:

*Request*

`GET /api/v1/backgrounds?location=sacramento`

*Response*

```json
{
    "data": {
        "type": "image",
        "id": null,
        "attributes": {
            "image": {
                "location": "Sacramento ",
                "image_url": "https://images.unsplash.com/photo-1606188476311-f943475a7e1f?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxzYWNyYW1lbnRvfGVufDB8fHx8MTY1NDY2NzA4Nw&ixlib=rb-1.2.1&q=80",
                "credit": {
                    "source": "unsplash.com",
                    "author": "Stephen Leonardi"
                }
            }
        }
    }
}
```
#### Register as a user:

*Request*

``POST /api/v1/users``

Request body:
```json
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

*Response*
```json
{
    "data": {
      "type": "users",
      "id": "1",
      "attributes": {
          "email": "whatever@example.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
    }
}
```

#### Login a user:

*Request*

`POST /api/v1/sessions`

Request body:
```json
{
  "email": "whatever@example.com",
  "password": "password"
}
```

*Response*
```json
{
    "data": {
      "type": "users",
      "id": "1",
      "attributes": {
          "email": "whatever@example.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
    }
}
```

#### Roadtrip:

*Request*

`POST /api/v1/road_trip`

Request body:
```json
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

*Response*
```json
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temperature": 67.69,
                "conditions": "clear sky"
            }
        }
    }
}
```
