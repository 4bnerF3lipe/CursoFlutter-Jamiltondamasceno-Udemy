import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCep = TextEditingController();

  String _resultado = "Resultado";

  _recuperarCep() async{
    String resultadoCep = _controllerCep.text;

    String url = "https://viacep.com.br/ws/${resultadoCep}/json/";
    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String,dynamic> retorno = json.decode( response.body );
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];


      setState(() {
        _resultado= "${logradouro}, ${bairro}, ${localidade}, ${uf.toUpperCase()}";
      });


   // print("Resposta longadouro: $logradouro} bairro: $bairro localidade: $localidade  ");

  }
    void _limparCampo(){
    setState(() {
      _resultado = "Resultado";
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APi CEP"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text(_resultado),
            TextField(

              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um CEP"
              ),
              controller: _controllerCep,
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    child: Text("Procurar CEP"),
                    onPressed: _recuperarCep
                ),
                RaisedButton(
                    child: Text("Limpar CEP"),
                    onPressed: _limparCampo
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
