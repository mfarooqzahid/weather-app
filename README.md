# Weather App 

A beautiful and intuitive Flutter weather application that provides real-time weather information with a clean, modern interface.

##  Features

- Clean and intuitive user interface
- Current weather conditions
- Temperature display with weather icons
- Location-based weather information
- Responsive design for all screen sizes

##  Architecture

This application follows a clean architecture pattern with clear separation of concerns:

```
/lib
├── /application
│   ├── /controller     # Business logic and state management
│   ├── /model         # Weather data models
│   ├── /presentation  # UI components and screens
│   └── /service       # API calls and remote data handling
├── /core              # Core 
└── main.dart          # Application entry point
```

### Architecture Flow
**API → Service → Controller → Presentation**

The data flows from the Weather API through the service layer, processed by controllers, and displayed in the presentation layer.

## API Integration

**Weather Data Provider:** [weatherapi.com](https://www.weatherapi.com/)

This application uses weatherapi.com to fetch real-time weather data including:
- Current weather conditions
- Temperature readings
- Weather descriptions

## Getting Started

### Prerequisites

- Flutter SDK 3.29.3 or higher
- Dart SDK

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mfarooqzahid/weather-app
   cd weather_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📦 Dependencies

The application uses the following key packages:

```yaml
dependencies:
  flutter_dotenv: ^5.1.0    # Environment variable management
  http: ^1.1.0              # HTTP requests for API calls
```
