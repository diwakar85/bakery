import 'package:firebase_auth/firebase_auth.dart';

class FaierbaseAuthentication{
  FaierbaseAuthentication._();

  static final FaierbaseAuthentication fierbaseAuth=FaierbaseAuthentication._();

  static final FirebaseAuth auth=FirebaseAuth.instance;

  Future<User?>Registration(String? Email,String? Password )async{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: Email!, password: Password!);
    return userCredential.user!;
  }
  Future<User?> LogingWithEmai(String? Email,String? Password)async{
   UserCredential userCredential =await auth.signInWithEmailAndPassword(email: Email!, password: Password!);
   return userCredential.user!;
  }
}