import 'package:flutter/material.dart';
import 'Home/Home.dart';
// Import your global here
import 'Global/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    /// [DynamicTheme] this is you theme in global
    /// Make sure you add DynamicTheme to have a guide when
    /// you will call the variable names.
    return StreamBuilder<DynamicTheme>(

      /// [custom.streamColors] This is your stream in your package.
      /// You need to initialize this one.
      stream: custom.streamColors.stream,

      /// of course your need to pass your Initial so that your
      /// app will not throw an error.
      /// [initial] came from globals.
      initialData: initial,

      /// [Snapshot] this will be your data when you pass your Themes.
      builder: (context, snap) {

        /// Make sure [DON'T FORGET THIS ONE]
        /// this is your snapshot that you can call anypage of your projects.
        /// this came from global so you can easily call your custom theme in any pages.
        /// before return your widgets.
        snapshot = snap;
        return MaterialApp(
            title: 'Dynamic Custom Theme Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: snap.data.brightness
            ),
            home: MyHomePage(title: 'Dynamic Custom Theme Demo'),
        );
      }
    );
  }
}