import 'dart:convert';
import 'package:bakery/Model_Class/model_class_one.dart';
import 'package:bakery/Screens/new_button_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Post Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 Future<List<Post>?> fatchData()async{
    String API="https://jsonplaceholder.typicode.com/posts";

    http.Response response=await http.get(Uri.parse(API));

    if (response.statusCode==200) {
      List<dynamic>data=jsonDecode(response.body);
      return data.map((e) => Post.formjson(e)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ApiData",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text("CommentPage"),
              onPressed: (){
                Get.to(const Details());
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800)
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fatchData(),
        builder: (context,shnapshot){
          if (shnapshot.hasError) {
            return Center(child: Text("${shnapshot.error}"),);
          }
          else if (shnapshot.hasData) {
            List<Post>?data=shnapshot.data as List<Post>?;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context,i){
                return Card(
                  elevation: 5,
                  child:ListTile(
                    leading: Text("${data?[i].id.toString()}"),
                    title: Text("${data?[i].title}"),
                    subtitle: Text("${data?[i].body}"),
                  ),
                );
              }
            );
          }
          return Center(child: CircularProgressIndicator(),);
        }
      ),
      floatingActionButton: ElevatedButton(
        child: const Text("Create new post button"),
        onPressed: (){
          Get.to(NewPost());
        },
      ),
    );
  }
}
