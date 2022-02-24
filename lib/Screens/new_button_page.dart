import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../Model_Class/model_class_one.dart';
import 'details_page.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
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
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: const Text(
          "ApiData",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
                        onTap: (){
                          Get.to(DeteailsPage(),arguments: data?[i]);
                        },
                      ),
                    );
                  }
              );
            }
            return Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }
}
