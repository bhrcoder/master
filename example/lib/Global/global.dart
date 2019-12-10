library custom_theme;

import 'package:dynamic_custom_theme/dynamic_custom_theme.dart';
import 'package:flutter/material.dart';

/// Boolean for switch button
bool themeSwitched = false; 

/// This will your new custom dynamic theme
/// *** [TO IMPLEMENT THIS YOU CAN CALL custom.streamColors, to listen to your Colors]
/// *** [You can also set your Dynamic Theme]
/// You can alse check in main.dart for how to use this.
CustomTheme<DynamicTheme> custom = CustomTheme();

/// This [snapshot] will receive your all 
/// custom theme, to access your themes
/// user [snapshot.data.value].
AsyncSnapshot<DynamicTheme> snapshot;

/// This will be your class for creating dynamic Themes.
/// You can also add your custom Color,Brightness,Size, etc.
/// by adding in parameters.
/// [If you will add some parameters here, make sure you also add in INITIAL, LIGHT and DARK Mode]
/// so you will not get an error.
class DynamicTheme {
  final Brightness brightness;
  final Color text;
  final double fontSize;
  DynamicTheme({this.brightness, this.text, this.fontSize});
}

/// You can also create your initial custome theme
/// if you doesn't have a custom theme
/// this is [OPTIONAL] you can pass your initial by your lightMode
DynamicTheme initial = DynamicTheme(
  brightness: Brightness.light,
  text: Colors.red,
  fontSize: 20,
);

/// You can also create you custom dynamic theme for [LIGHT] mode
/// [LIGHT] and [INITIAL] MUST BE SAME!
DynamicTheme lightMode = DynamicTheme(
  brightness: Brightness.light,
  text: Colors.red,
  fontSize: 20,
);

/// You can also create you custom dynamic theme for [DARK] mode
DynamicTheme darkMode = DynamicTheme(
  brightness: Brightness.dark,
  text: Colors.blue,
  fontSize: 55,
);
