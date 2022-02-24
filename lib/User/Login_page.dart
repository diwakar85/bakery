import 'package:bakery/Screens/dashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper_class/helper_class.dart';
import 'Signup_page.dart';
import 'intro_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final useridController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const IntroPage()));
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const CircleAvatar(
                    maxRadius: 65,
                    backgroundImage: AssetImage("assets/p1.png"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Sign Into your Account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Card(
                            child:TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'validate E-mail';
                                }
                                return null;
                              },
                              controller: useridController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "Enter User Id",
                                prefixIcon:const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                errorStyle: const TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Card(
                            child:TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'validate Password';
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.pink,
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "Enter Password",
                                prefixIcon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                errorStyle: const TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFFF7900),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              onPressed: ()async {
                                if (_formKey.currentState!.validate()) {
                                 _formKey.currentState!.save();
                                 User? user=await FaierbaseAuthentication.fierbaseAuth.LogingWithEmai(useridController.text,passwordController.text);
                                 Get.off( const HomePage());
                                 useridController.clear();
                                 passwordController.clear();
                                 setState(() {
                                   var email="";
                                   var password="";
                                 });
                                 Get.snackbar(
                                   "Registration Successful:${user!.uid}\n Email:${user.email}",
                                   "Hello everyone",
                                   margin: const EdgeInsets.all(10),
                                   barBlur: 10,
                                   backgroundColor: Colors.green,
                                   icon: const Icon(Icons.person, color: Colors.white),
                                   snackPosition: SnackPosition.TOP,

                                 );
                                }  
                              },
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                               const Text(
                                "Don't Have Account?",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                  child: const Text("SignUp",style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.bold),),
                                onTap:(){
                                    Get.to(const Signup());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
