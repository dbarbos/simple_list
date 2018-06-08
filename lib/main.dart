import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(
        items: List<String>.generate(10, (i) => "Item $i")
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<String> items;

  MyHomePage({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista')
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ItemDetails(item: items[index],))
              );
            }
          );
        },
      ),
    );
  }

}

class ItemDetails extends StatelessWidget {

  final String item;

  ItemDetails({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$item'),
      ),
      body: Center(
        child: Text('$item'),
      ),
    );
  }

}