import 'package:flutter/material.dart';

import './car.dart';
import './cars_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Luxury cars gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _cars = cars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Colors.cyan),
        itemCount: _cars.length,
        itemBuilder: (context, index){
          final item = _cars[index];
          return Dismissible(
              key: Key(item.model),
              background: Container(
                child: const Icon(Icons.delete, size: 40, color: Colors.white),
                color: Colors.cyan,
              ),
              onDismissed: (direction) {
                setState(() {
                  _cars.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item.brand} ${item.model} deleted !"))
                );
              },
              child: ListTile(
                title: Text(
                  item.model,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      fontSize: 20
                  ),
                ),
                subtitle: Text(
                  item.brand,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            "${item.brand} ${item.model}",
                            style: const TextStyle(color: Colors.cyan),
                          ),
                          content: item.image,
                        );
                      }
                  );
                },
              ),
          );
        }),
    );
  }
}
