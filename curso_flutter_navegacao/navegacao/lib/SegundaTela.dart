import 'package:flutter/material.dart';
import 'package:navegacao/Home.dart';

class SegundaTela extends StatefulWidget {
  String valor;
  SegundaTela({this.valor});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Segunda tela! Valor passado ${widget.valor}"),
            RaisedButton(
              textColor: Colors.orange,
              child: Text("Ir para segunda Tela"),
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.pop(context,'/');
              },
            )
          ],
        ),
      ),
    );
  }
}
