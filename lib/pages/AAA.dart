import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Bottom sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
PersistentBottomSheetController controller;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 200,
            child: Scaffold(
              key: _scaffoldKey,
              body: Container(
                child: RaisedButton(
                  onPressed: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Text("Show Bottom"),
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            child: Scaffold(
              body: Container(
                  child: RaisedButton(
                onPressed: () {
                  _closeModalBottomSheet();
                },
                child: Text("Hide Bottom"),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  controller =
      _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) {
    return new Container(
        child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text(
              'Some title!',
              textAlign: TextAlign.left,
            )),
        new Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper massa metus, sed pharetra mauris porttitor et. Nullam ac ultrices leo. Praesent sed consequat risus. ',
          textAlign: TextAlign.left,
        ),
      ],
    ));
  });
}

void _closeModalBottomSheet() {
  if (controller != null) {
    controller.close();
    controller = null;
  }
}