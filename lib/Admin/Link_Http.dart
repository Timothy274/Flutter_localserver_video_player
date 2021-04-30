import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localserver_video_player/Map/link.dart';
import 'package:http/http.dart' as http;

class Link_Http extends StatefulWidget {
  @override
  _Link_HttpState createState() => _Link_HttpState();
}

class _Link_HttpState extends State<Link_Http> {
  final link_http = TextEditingController();
  final link_db = TextEditingController();
  List<Link> dataLink = [];

  Future<List<Link>> getUser() async {
    final response = await http
        .get(Uri.parse("http://timothy.buzz/video_pi/user_account/user.php"));
    final responseJson = json.decode(response.body);
    setState(() {
      for (Map Data in responseJson) {
        dataLink.add(Link.fromJson(Data));
      }
    });
  }

  void _showdialogerror() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content:
              new Text("Data yang dimasukkan kurang, mohon periksa kembali"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text("Link alamat Http server"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 20.0, right: 20.0),
                      child: TextField(
                        controller: link_http,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(11, 189, 180, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(11, 189, 180, 1)),
                          ),
                          hintText: "Masukkan link",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 30),
                      child: Text("Link alamat gatabase"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 20.0, right: 20.0),
                      child: TextField(
                        controller: link_db,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(11, 189, 180, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(11, 189, 180, 1)),
                          ),
                          hintText: "Masukkan link",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: new SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color.fromRGBO(11, 189, 180, 1),
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   new MaterialPageRoute(
                            //       builder: (BuildContext context)=> new MyHomePage()
                            //   )
                            // );
                            validasi();
                          },
                          child: const Text('Update Link',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validasi() {
    if ((link_http.text == "") && (link_db.text == "")) {
      _showdialogerror();
    } else {
      if (dataLink.isEmpty) {
        print('kosong');
      } else {
        print("ada");
      }
    }
  }
}
