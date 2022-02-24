import 'dart:convert';

import 'package:bakery/Model_Class/Post%20_Details_Model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<Comment?>fatchData()async{
    String API="https://jsonplaceholder.typicode.com/comments/1";

    http.Response response=await http.get(Uri.parse(API));
    if (response.statusCode==200) {
      Map<String,dynamic>data=jsonDecode(response.body);
      return Comment.formjson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Comment Page"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fatchData(),
        builder: (context,shanopshot){
          if (shanopshot.hasError) {
            return Center(child: Text("${shanopshot.error}"),);
          }
          else if (shanopshot.hasData) {
            Comment? data=shanopshot.data as Comment?;

            return Card(
              child:ListTile(
                leading: Text("${data?.id.toString()}"),
                title: Text("${data?.name}\n Email:${data?.email}"),
                subtitle: Text("${data?.body}"),
              ),
            );
          }
          return Center(child:CircularProgressIndicator());
        }
      ),
    );
  }
}
