# Weather App

An app to get weather reports using the [Metaweather API](https://www.metaweather.com/api/).

## Getting Started

### Requirements

- [Flutter](https://flutter.dev)
- [Dart](https://dart.dev)
- [Android Studio](https://developer.android.com/studio) (To run the app on android)
- [Xcode](https://developer.apple.com/xcode/) (To run the app on iOS or MacOS)

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

This project follows a layered architecture flavoured with the BLoC pattern. Every feature is encapsulated in a layered module. In the root of every feature, we find a barel file which exports all the necessary files of the module.

### Feature

![Layered Architecture with BLoC Pattern](/docs/bloc.png)

This app currently has only one feature: **Weather**. In the weather feature, we find three layers: the **Presentation Layer** (Views folder), the **Business Logic Layer** (Logic folder) and the **Data Layer** (Data folder).

- _Views_ are all components that compose the user interface of our application. At the highest level of the views, we have the pages. Our application only has one page: `WeatherReportPage` and the page has multiple components or widgets; for example we have the `WeatherReportCard` which is the widget that shows the weather of selected day; the widget takes the main portion of the page, and we have multiple other components well.

- _Logic_ has the components that handles the business logic of our feature. In the _logic_ folder, we have two main types of components: a repository and a cubit. The repository is the link between the data layer and the state of our application. Its main function is to prepare the data for the presentation layer. The cubit on the other side handles managing the states and passing data to the views. In our feature, we have only one cubit `WeatherReportCubit` and one type of repository: `IWeatherReportRepository`. Note that there could be multiple implementations of this repository, the cubit does not care, as long as they all implement the required operations. In our case since we only have one data source which is the API, we will only have one implementation of the `IWeatherReportRepository`. But later, if we want to get the weather data from another source, we may create a new implementation of the `IWeatherReportRepository` that will use that new data source instead; we will not need to do much change.

- _Data_ layer holds the data sources and the data entities or models. Our application does not make use of local storage and we only have one remote data source (metaweather API); so this layer only has one data source: the Metaweather API. The `MetaWeatherAPI` class takes care of the communication with the API and parses the data into the models that our application is aware of such as `Weather` and `City`; those are our entities.

### Global

In the `lib/` directory, besides the weather feature, we also have a couple of stuff: the `core/` folder, two files: _main.dart_ and _app.dart_.

The core folder holds objects that are not scoped by a specific feature. We find mainly utility classes, helper functions, extensions and constants. We don't have any constant or helper function in our app so the folder only holds the `Debouncer` class and a couple of extensions. The `Debouncer` class provides a `run` method to debounce operations.

_main.dart_ is the entry point of our application, nothing fancy in there, just providing repositories down when running the `App` widget.

_app.dart_ is home of the `App()` widget which is the head of our widget tree. This widget also injects cubits down the tree thanks to `BlocProvider`.
