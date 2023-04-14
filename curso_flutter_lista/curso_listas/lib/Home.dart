import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];
  void _carregarItens(){

    _itens = [];
    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Lorem ipsum dolar sit amet.";
      item["descricao"] = "Descricao ${i} Lorem ipsum dolar sit amet.";
      _itens.add(item);

    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
            itemBuilder: (context,indice){
              Map<String, dynamic> item = _itens[indice];
              print("item $indice");
              return ListTile(
                onTap: (){
                  showDialog(
                      context: context,
                    builder: (context){
                        return Theme(data: ThemeData(dialogBackgroundColor: Colors.white),
                          child: AlertDialog(
                            title: Text(
                              item["titulo"].toString(),
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20
                              ),
                            ),
                            titlePadding: EdgeInsets.all(50),
                            content: Text(_itens[indice]["descricao"]),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Sim"),
                              ),
                              FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Não"),
                              ),

                            ],

                          )

                          ,);
                    }
                  );
                },
                // onLongPress: (){
                //
                // },
                title: Text(item["titulo"].toString()),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }
        ),
      ),
    );
  }
}
