import 'package:curso_future/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class JsonHolder extends StatefulWidget {
  @override
  State<JsonHolder> createState() => _JsonHolderState();
}

class _JsonHolderState extends State<JsonHolder> {

  String urlBase = "https://jsonplaceholder.typicode.com";


  Future<List<Post>> _recuperarPostagens() async{

    http.Response response = await http.get(urlBase+"/posts");
    var dadosJson = json.decode( response.body );

    List<Post> postagens = List();
    for( var post in dadosJson ) {
      Post p = Post(post["userId"], post["id"],post["title"],post["body"]);
      postagens.add(p);
    }
    return postagens;


  }

  
  _post() async{
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null ,
          "title": "Titulo",
          "body": "Corpo da postagem"
        }
    );

    http.Response response = await http.post(
      urlBase+"/posts",
      headers:{'Content-type': 'application/json; charset=UTF-8',},
      body: corpo
    );
  }
  _put() async{
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null ,
          "title": "Titulo alterado",
          "body": "Corpo da postagem alterado"
        }
    );

    http.Response response = await http.put(
        urlBase+"/posts/2",
        headers:{'Content-type': 'application/json; charset=UTF-8',},
        body: corpo
    );
    print ("Resposta: ${response.statusCode}");
    print ("Resposta: ${response.body}");

  }
  _patch() async{
    var corpo = json.encode(
        {
          "userId": 120,
          "body": "Corpo da postagem alterado"
        }
    );

    http.Response response = await http.patch(
        urlBase+"/posts/2",
        headers:{'Content-type': 'application/json; charset=UTF-8',},
        body: corpo
    );
    print ("Resposta: ${response.statusCode}");
    print ("Resposta: ${response.body}");

  }
  _delete() async{
    http.Response response = await http.delete(
      urlBase + "/posts/2"
    );
    print ("Resposta: ${response.statusCode}");
    print ("Resposta: ${response.body}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("consumo de serviço API avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _patch,
                ),
                RaisedButton(
                  child: Text("Deletar"),
                  onPressed: _delete,
                ),

              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context,snapshot){
                    switch( snapshot.connectionState ){
                      case ConnectionState.none :
                      case ConnectionState.active :
                      case ConnectionState.waiting :
                        return Center(child: CircularProgressIndicator());
                        break;
                      case ConnectionState.done :
                        print("Connection done");
                        if ( snapshot.hasError) {
                          print("Connection error");
                        }  else{
                          print("Connection success");
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List<Post> lista = snapshot.data;
                                Post post = lista[index];
                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              }
                          );

                        }
                        break;
                    }
                  },
                ),
            )
          ],
        ),
      )
    );
  }
}
