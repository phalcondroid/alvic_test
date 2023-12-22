import 'dart:convert';

import 'package:alvic_test/components/characters/presentation/widgets/custom_button_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {

  List<dynamic> characterList = [];

  /// Get characters from server
  Future<void> getCharactersFromServer() async {
    var characters =
      await http.get(Uri.https("mocki.io", "v1/5a4770a5-8e75-4a4b-93e8-0fded9315ab2"));
    Map<dynamic, dynamic> result = jsonDecode(characters.body);
    setState(() {
      characterList = result["results"];
    });
  }

  @override
  void initState() {
    getCharactersFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: const Text("List of characters"),
        actions: [
          CustomButtonDialog(imageUrl: "", title: "", content: "",),
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.network("https://cdn-icons-png.flaticon.com/512/3308/3308395.png"),
                        maxRadius: 40,
                      ),
                      Text(
                        "Alvic web site: https://alvic.com/", 
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Text(
                        "https://alvic.com/", 
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Center(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: Icon(Icons.close)
                        )
                      )
                    ],
                  ),
                ),
              );
            });
          }, icon: Icon(Icons.web))
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: characterList.length,
          itemBuilder: (context, index) {
            var character = characterList[index];
              return Container(
                width: double.infinity,
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20.0,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  character["name"],
                                  style: TextStyle(
                                    fontSize: 22.0
                                  ),
                                )
                              ),
                            ),
                            Image.network(character["image"]),
                            Container(
                              height: 350,
                              child: Container(
                                color: Colors.blueGrey[50],
                                child: Column(
                                  children: [
                                    // Generic grid content
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(child:Text(
                                            "Nombre",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )),
                                          Expanded(child:Text(
                                            character["name"],
                                            style: TextStyle(
                                              fontSize: 18.0
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(child:Text(
                                            "Genero",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )),
                                          Expanded(child:Text(
                                            character["gender"],
                                            style: TextStyle(
                                              fontSize: 18.0
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Ver detalle"),
                            ),
                            onPressed: () {
                              
                            },
                          )
                        )
                      ]
                    ),
                  ),
                ),
              );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}