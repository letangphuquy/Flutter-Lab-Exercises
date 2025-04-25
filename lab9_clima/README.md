# Clima Weather App

A Flutter weather application that shows real-time weather data based on current location or city search.

## Features

- Get weather data based on device's current location
- Search weather by city name
- Display temperature and weather conditions
- Modern UI with custom backgrounds
- Loading screen with progress indicator

## Technical Details

- Uses OpenWeatherAPI for weather data
- Implements geolocation using geolocator package
- Stateful widgets for managing weather data state
- Navigator for screen transitions
- Asynchronous API calls for data fetching

## Project Structure

Key components:
- `lib/screens/`
  - `loading_screen.dart`: Initial loading screen with location detection
  - `location_screen.dart`: Main weather display screen
  - `city_screen.dart`: City search interface

## Getting Started

1. Clone the repository
2. Get dependencies:
```bash
flutter pub get
```
3. Run the app:
```bash
flutter run
```

## Dependencies

- Flutter SDK
- geolocator package
- OpenWeatherMap API key required
````

This README reflects the actual implementation seen in the code files, focusing on the weather app's key features and technical components.
