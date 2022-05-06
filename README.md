# Another Weather App

This is just another weather app, but this time with data from [Metaweather](https://www.metaweather.com) and a different design.

---
<h2 align=center>Another Weather App ?</h2>

---
This app is actually [my](https:github.com/silverhairs) submission of the flutter challenge for the position of Senior Mobile Engineer at [Flaconi](https://flaconi.de)


## Getting Started

This project runs on iOS, Android, Windows, MacOS and all other platforms supported by Flutter.

### How to run the app
In the root directory of the project, run the command below:
```
$ flutter run
```

### How to run the tests
In the root directory of the project, run the command below:
```
$ flutter test
```

## Architecture
This project follows the BLoC architecture and every feature has its own module. Features are available in the lib/ directory at the same level as `main.dart` and `app.dart`. Since the project only has one feature: `Weather Reporting`; there is only one feature directory: `lib/weather`.

* **main.dart**  
This file is the entrypoint of the app, there is nothing fancy in it, just providing repositories to the app and running the `App()` widget.

* **app.dart**  
This file holds the `App` widget which is the head of our widget tree. The `App` widget gets repositories from above it and creates `cubits` and `blocs`. The repository in out case is an implementation of `IWeatherReportRepository`, the repository is passed to a `WeatherReportCubit` which at its turn is provided to the widget tree via a `BlocProvider`.

* **Weather Feature**  
Everything related to this feature is in the `weather` directory. In the said directory we have three sub directories: `data`, `logic` and `views`.
    - `data` handles everything related to data for our weather feature: data sources, models etc.
    - `logic` handles the business logic of our feature. We find in it a repository, a cubit and the states.
    - `views` holds everything related to the UI/Presentation of our app: pages and widgets(components).


* **core**  In the `lib` directory we also find the `core` sub directory which holds code that is not scoped to a specific `feature`. Mainly utility classes, helpers, extensions, global components etc. We don't really have any global component in the app since we only have one feature but we have some utility classes and extensions over there.

### State Management
State Management is handled mainly with a cubit and in some parts, a `ValueNotifier`.

### The API.
The `WeatherAPI` class which can be found in the data layer of our `weather` feature  handles communication with the MetaWeather API and makes all the necessary requests. 

