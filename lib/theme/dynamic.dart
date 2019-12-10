import 'dart:async';
// import 'package:flutter/cupertino.dart'; 

/// This will be the class for Custom Themes.
/// T will be the class you will passed.
class CustomTheme<T> {
  /// this will be the stream for the colors dynamic.
  /// example data that will received.
  /// {
  ///   'brightness' : Brightness.dark,
  /// }
  /// or send via class
  StreamController<T> streamColors = StreamController();

  /// This will be the list of dynamic theme.
  /// you can pass this to your global page.
  /// it will be easily access.
  /// [REMOVE]
  // AsyncSnapshot<T> snapshot;

  /// This will be the setter for your custom themes.
  Future<void> setThemes(T) async {
    streamColors.add(T);
  }

  /// This will close your stream controller.
  /// after closing you cannot listen and set for your custom themes.
  Future<void> stopThemes() async {
    streamColors.close();
    streamColors = null;
  }
}
