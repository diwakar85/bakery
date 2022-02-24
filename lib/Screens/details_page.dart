 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeteailsPage extends StatefulWidget {
  const DeteailsPage({Key? key}) : super(key: key);

  @override
  _DeteailsPageState createState() => _DeteailsPageState();
}

class _DeteailsPageState extends State<DeteailsPage> {
  @override
  Widget build(BuildContext context) {
    var data=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.id.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(data.title,style: TextStyle(fontSize: 30),),
            SizedBox(height: 40,),
            Text(data.body,style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
