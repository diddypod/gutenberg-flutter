import 'package:flutter/material.dart';
import 'gutenberg/id_handler.dart' as id;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Gutenberg',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: MyHomePage(title: 'Project Gutenberg'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _id;
  String _url = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Image(
              image: AssetImage('assets/icons/logo.png'),
              height: 150,
            ),
            const SizedBox(height: 70.0),
            Center(
              child: Text(
                "Project Gutenberg",
                style: TextStyle(
                  fontFamily: "PlayfairDisplay",
                  fontSize: Theme.of(context).textTheme.display2.fontSize,
                  color: Colors.red[900],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey[500],
                    ),
                  ),
                  labelText: 'Book ID',
                  hintText: 'ID of the book you want to search for',
                ),
                onChanged: (String value) {
                  _id = value;
                },
              ),
            ),
            const SizedBox(height: 30.0),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      Text(" SEARCH"),
                    ],
                  ),
                  color: Colors.red[800],
                  textColor: Colors.white,
                  onPressed: () {
                    _url = id.urlGenerator(_id);
                    print(_url);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
