import 'package:flutter/material.dart';
// to use your cutom theme import your global here.
import '../Global/global.dart';
import 'second.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text('This is dynamic font color and Size',
              style: TextStyle(
                fontSize: snapshot.data.fontSize,
                color: snapshot.data.text
              ),),
            ),
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.wb_sunny),
                  Text('Pressed here to change in LIGHT mode.')
                ],
              ),
              onPressed: () async {
                await custom.setThemes(lightMode);
                themeSwitched = false;
              },
            ),

            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.autorenew),
                  Text('Pressed here to change in DARK mode.')
                ],
              ),
              onPressed: () async{
                await custom.setThemes(darkMode);
                themeSwitched = true;
              },
            ),

            Expanded(
              child: Center(
                child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.navigate_next),
                      Text('Go to next page.')
                    ],
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => SecondPage());
                    Navigator.push(context, route);
                  },
                ),
              ),
            ),
             
          ],
        ),
      ), 
    );
  }
}

