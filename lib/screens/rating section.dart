import 'package:flutter/material.dart';

void main() {
  runApp(RatingScreen());
}

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Heart Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> favList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Heart Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    favList.add('This is a red container');
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    favList.add('This is a green container');
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    favList.add('This is a blue container');
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Favorites: ${favList.join('\n')}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
