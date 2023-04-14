import 'package:flutter/material.dart';
import 'package:navegacao/Home.dart';
import 'package:navegacao/SegundaTela.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: "/",
    routes: {
      "/secuntaria" : (context) => SegundaTela(),
    },
    home: Home(),
  )
);


