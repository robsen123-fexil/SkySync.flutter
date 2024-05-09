// ignore_for_file: non_constant_identifier_names, unused_element, prefer_const_constructors, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String getImage(int temp) {
    if (temp > 25) {
      return 'images/clouds-3488632_1280.jpg';
    } else if (temp > 20) {
      return 'images/halfwinterhalfsummer.jpg';
    } else if (temp > 10) {
      return 'images/pngtree-rainy-weather-png-image_2923917.jpg';
    } else {
      return 'images/pexels-reneasmussen-25763.jpg';
    }
  }
}
