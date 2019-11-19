import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EventListe extends StatefulWidget {
  @override
  _EventListeState createState() => _EventListeState();
}

class Paar {
  String title;
  String url;

  int id;
  String joke;

  Paar.fromJsonMap(Map karte) {
    // für Fotos
   this.title = karte["title"];
   this.url = karte["url"]; // hier muss in den eckigen klammern den Identifikator der Json Strukutur stehen
   // für Jokes
    //this.id = karte["value"]["id"];
    //this.joke = karte["value"]["joke"];


  }
}

class _EventListeState extends State<EventListe> {

  StreamController<Paar> controller;
  List<Paar> namen = [];

  @override
  void dispose() { //
    super.dispose();
    controller?.close(); // checkt ob controller null ist mit dem "?" schützt vor exeption
    controller = null;
  }

  @override
  void initState() {
    super.initState();
    controller = StreamController.broadcast(); //Filterfunktion in den klammern möglich
    controller.stream.listen((p) {
      setState(() {
        namen.add(p);
      });
    });

    load(controller);
  }

  void load(StreamController scr) async {
    String url = "https://jsonplaceholder.typicode.com/photos"; //für fotos
    //String url = "http://api.icndb.com/jokes/random"; // für jokes
    var client = new http.Client();
    var request = http.Request('get', Uri.parse(url)); //funktioniert auch mit put, delete anstelle von get
    var streamedResponse = await client.send(request); //await damit nicht überladen wartet bis er bereit ist

    streamedResponse.stream
    .transform(utf8.decoder)
    .transform(json.decoder)
    //für Jokes ausschalten
    .expand((e) => e) //sorgt dafür das Schrittweise die Json Objekte eingehen und das schon codiert
    .map((map) => Paar.fromJsonMap(map)) //aus der Map ein Foto erzeugt
    .pipe(controller); //Und nun in den gewünschten controller eingefügt
  }

  void _AddNames(String text) {
    setState(() {
      //namen.add(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: namen.length,
          itemBuilder: (context, index) {
            //return Text("$index ${namen[index].url}");
            return _makeElement(index);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _AddNames("Paul");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _makeElement(index) {
    if (index >= namen.length) {
      return null;
    }
    return Image.network(namen[index].url); //für Foto
    //return Text(namen[index].url); //für jokes
  }

}
