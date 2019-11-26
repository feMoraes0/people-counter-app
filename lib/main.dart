import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'People Counter',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _infoText = "Enter";
  int _people = 0;

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if(_people < 0)
        _infoText = "Upside down";
      else if(_people <= 10)
        _infoText = "Enter";
      else
        _infoText = "Full";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: size.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "People: $_people",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
