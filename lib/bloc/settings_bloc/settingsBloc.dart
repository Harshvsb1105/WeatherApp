import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/settings_bloc/settingsEvents.dart';
import 'package:flutter_weather/bloc/settings_bloc/settingsState.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState =>
      SettingsState(temperatureUnits: TemperatureUnits.celsius);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is TemperatureUnitToggled)
      yield SettingsState(
          temperatureUnits: state.temperatureUnits == TemperatureUnits.celsius
              ? TemperatureUnits.fahrenheit
              : TemperatureUnits.celsius);
  }
}
