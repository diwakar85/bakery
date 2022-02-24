import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Login_page.dart';
import 'Signup_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body:SingleChildScrollView(
        child:Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFFF7900),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children:  [
                  SizedBox(height: MediaQuery.of(context).size.height*0.1),
                  const CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/p1.png"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.15),
                  SingleChildScrollView(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:150,
                          height:50,
                          child: ElevatedButton(
                            child:const Text("Login",style:  TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                                primary:const Color(0xFFFFFFFF),
                              shadowColor:Colors.cyanAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                            ),
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                            },
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.height*0.04),
                        SizedBox(
                          width:150,
                          height:50,
                          child: ElevatedButton(
                            child: const Text("Register",style:  TextStyle(color: Colors.black),),
                            style:  ElevatedButton.styleFrom(
                                primary:const Color(0xFFFFFFFF),
                                shadowColor:Colors.cyanAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                            onPressed: (){
                              Get.to(const Signup());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height:40,),
                  const Text("Now! Qyick Login Use Touch ID",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),
                  const SizedBox(height:40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(child: const Image(image: AssetImage("assets/p2.png"),color: Colors.white),
                        onTap: (){
                          Get.snackbar(
                            "Allowed FingerPrint",
                            "Hello everyone",
                            margin: const EdgeInsets.all(10),
                            barBlur: 10,
                            backgroundColor: Colors.green,
                            icon: const Icon(Icons.person, color: Colors.white),
                            snackPosition: SnackPosition.TOP,

                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height:40,),
                  const Text("Touch ID",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
