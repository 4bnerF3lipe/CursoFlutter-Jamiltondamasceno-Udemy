import 'package:flutter/material.dart';
import 'package:navegacao/SegundaTela.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tela'),
        backgroundColor: Color.fromARGB(228, 26, 133, 150),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              textColor: Colors.orange,
              child: Text("Ir para segunda Tela"),
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.pushNamed(context, "/secuntaria");
              },
            )
          ],
        ),
      ),
    );
  }
}
