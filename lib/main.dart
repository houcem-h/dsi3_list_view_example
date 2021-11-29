import 'package:flutter/material.dart';

import './car.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  final List<Car> _cars = [
    Car('Aston Martin', 'Virage', Image.asset('images/aston_martin_virage.jpg')),
    Car('Audi', 'R8', Image.asset('images/audi_r8.jpg')),
    Car('BMW', 'i8', Image.asset('images/bmw_i8.jpg')),
    Car('BMW', 'M4', Image.asset('images/bmw_m4.jpg')),
    Car('BMW', 'M5', Image.asset('images/bmw_m5.jpg')),
    Car('Bugatti', 'Chiron', Image.asset('images/bugatti_chiron.jpg')),
    Car('Dodge', 'Challenger', Image.asset('images/dodge_challenger.jpg')),
    Car('Lamborghini', 'Huracan', Image.asset('images/lamborghini_huracan.jpg')),
    Car('Mercedes', 'GLA', Image.asset('images/mercedes_gla.jpg')),
    Car('Mercedes', 'SLS', Image.asset('images/mercedes_sls.jpg')),
    Car('Mustang', 'GT Premium', Image.asset('images/mustang_gt_premium.jpg')),
    Car('Porshe', '911', Image.asset('images/porshe_911.jpg')),
    Car('Porshe', 'Panamera', Image.asset('images/porshe_panamera.jpg')),
    Car('Rolls Royce', 'Ghost', Image.asset('images/rolls_royce_ghost.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
                title: Text(item.model),
              ),
          );
        }),
    );
  }
}
