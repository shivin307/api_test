import 'dart:convert';

import 'package:api_test/controller/albumsController.dart';
import 'package:api_test/model/albumsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WeatherResponse> albums = [];

  @override
  void initState() {
    fetchData(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('API test'),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final albumsIndex = albums[index];
          return Container(
            // leading: CircleAvatar(child: Text(albumsIndex.id.toString())),
            child: Text(albumsIndex.output.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchData();
        Toast.show("API button pressed!",
            gravity: Toast.bottom, duration: Toast.lengthLong);
        print('button pressed');
      }),
    );
  }

  Future<void> fetchData() async {
    final response = await AlbumsContoller.fetchData();
    setState(() {
      albums = response;
      print(albums);
    });
  }
}
