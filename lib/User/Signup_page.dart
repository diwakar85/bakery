import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import '../helper_class/helper_class.dart';
import 'Login_page.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "";
  String password = "";
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnamenameController = TextEditingController();
  final passwordController = TextEditingController();
  final conformController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate=DateTime.now();
  dynamic groupval="gender";
  bool newdate = false;
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
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "SignUp",
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
                    "Create Account",
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
                                  return 'first name';
                                }
                                return null;
                              },
                              controller: firstnameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "first Name",
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'last name';
                                }
                                return null;
                              },
                              controller: lastnamenameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "last Name",
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
                              MediaQuery.of(context).size.height * 0.02
                          ),
                          Card(
                            child:TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              //validator: (input) => input?.isValidEmail() ? null : "Check your email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Email';
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                fillColor: Colors.pink,
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "Enter E-mail",
                                prefixIcon: const Icon(Icons.email),
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
                                if (value == null || value.isEmpty||value.length<8) {
                                  return 'Enter Strong password';
                                }
                                return null;
                              },
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.pink,
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "Enter password",
                                prefixIcon: const Icon(Icons.password),
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
                                if (value == null || value.isEmpty||value.length<8) {
                                  return 'Enter Strong password';
                                }
                                return null;
                              },

                              controller: conformController,
                              decoration: InputDecoration(
                                fillColor: Colors.pink,
                                labelStyle: const TextStyle(fontSize: 20.0),
                                hintText: "Conform password",
                                prefixIcon: const Icon(Icons.password),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                errorStyle: const TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    child:const Text("Date Of Birth"),
                                    onPressed: (){
                                      _selectDate(context);
                                    },
                                  ),
                                  Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
                                ],
                              ),
                            ),
                          ),
                          RadioListTile(
                            value: "male",
                            groupValue: groupval,
                            title:const Text("Male"),
                            onChanged: (val){
                              setState(() {
                                groupval=val;
                              });
                            },
                          ),
                          RadioListTile(
                            value: "Female",
                            groupValue: groupval,
                            title:const Text("Female"),
                            onChanged: (val){
                              setState(() {
                                groupval=val;
                              });
                            },
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFFF7900),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )),
                              onPressed: ()async{
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  User? user=await FaierbaseAuthentication.fierbaseAuth.Registration(emailController.text, passwordController.text);
                                  Get.to(const LoginScreen());
                                  firstnameController.clear();
                                  lastnamenameController.clear();
                                  passwordController.clear();
                                  emailController.clear();
                                  conformController.clear();
                                  setState(() {
                                    email="";
                                    password="";
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
                          const Text(
                            "login with social media",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          SignInButton(
                            Buttons.Google,
                            mini: false,
                            onPressed: () {

                            },
                          ),
                          SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.02),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                const Text(
                                  "Already have you account?",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  child: const Text("Login",style: TextStyle(color: Colors.blue,fontSize: 24, fontWeight: FontWeight.bold),),
                                  onTap:(){},
                                ),
                              ],
                            ),
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
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),

    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
