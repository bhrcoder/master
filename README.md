# dynamic_custom_theme

A new Flutter plugin for Custom Dynamic Themes. This package will help your application to build a Dynamic Custom Theme, You can add multiple custom Theme,Colors,Font,Background, etc. This Supports both iOS and Android. 

## DEMO
![Demo](demo.gif)

## Getting Started

To use this plugin, add `dynamic_custom_theme` as a dependency in your pubspec.yaml file. You can add multiple custom theme by adding in DynamicTheme class.


### Create global.dart to you project and paste this code below.
```dart
/// Import this
import 'package:dynamic_custom_theme/dynamic_custom_theme.dart';

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
```

### After creating global, add this to your global.dart
```dart
/// This will your new custom dynamic theme
/// *** [TO IMPLEMENT THIS YOU CAN CALL custom.streamColors, to listen to your Colors]
/// *** [You can also set your Dynamic Theme]
/// You can also check in main.dart for how to use this.
CustomTheme<DynamicTheme> custom = CustomTheme();

/// This [snapshot] will receive your all 
/// custom theme, to access your themes
/// user [snapshot.data.value].
AsyncSnapshot<DynamicTheme> snapshot;
```


### To your main.dart you need to replace this to your MyApp Class.
```dart
/// Also you need to import your global to your main.
/// So that you can call the custom Theme.
import 'Global/global.dart';

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
```

### To set your dynamic theme you can call this function 
```dart
/// lightMode and darkMode is located to your global, 
/// you can also add Color,size etc.
await custom.setThemes(lightMode);
/// or
await custom.setThemes(darkMode);
```

### You can now access you dynamic themes to somewhere to your pages. by calling [snapshot.data.value].
```dart
ThemeData(
    brightness: snapshot.data.brightness
),
```
```dart
TextStyle(
    fontSize: snapshot.data.fontSize,
    color: snapshot.data.text
)
```


### NOTE
[YOU NEED TO IMPORT YOUR GLOBAL IF YOU WANT TO USE YOUR DYNAMIC CUSTOM THEME.]