import 'package:custom_theme/Global/global.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('Open Modal'),
          onPressed: () {
            showDialog(context: context, builder: (context) => Modal());
          },
        ),
      ),
    );
  }
}

class Modal extends StatefulWidget {
  Modal({Key key}) : super(key: key);

  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom Theme'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Switch(
                value: themeSwitched,
                onChanged: (value) async {
                  setState(() {
                    themeSwitched = value;
                  });
                  if (themeSwitched) {
                    await custom.setThemes(darkMode);
                  } else {
                    await custom.setThemes(lightMode);
                  }
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Text('Switch to change Theme mode.')
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
