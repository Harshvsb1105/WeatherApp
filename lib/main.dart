import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_weather/bloc/theme_bloc/theme_state.dart';
import 'package:flutter_weather/bloc/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;
import 'bloc/settings_bloc/settingsBloc.dart';
import 'repositories/repositories.dart';
import 'widgets/weather.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(create: (context) => SettingsBloc())
      ],
      child: App(weatherRepository: weatherRepository),
    ),
  );
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Flutter Weather',
          theme: themeState.theme,
          home: BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
            child: Weather(),
          ),
        );
      },
    );
  }
}
