import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;
  const WeatherRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  final String city;
  WeatherRefreshRequested({@required this.city}) : assert(city != null);

  List<Object> get props => [city];
}