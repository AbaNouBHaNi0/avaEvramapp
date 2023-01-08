import 'package:auth_with_get/Views/Home_page.dart';
import 'package:auth_with_get/Views/authViews/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final box = GetStorage();
class AuthViewModel extends GetxController
{

  GoogleSignIn Inst = GoogleSignIn(scopes: ['email']);
  FirebaseAuth auth = FirebaseAuth.instance;

  void GoogleSignInMethod () async
  {

    showDialog(context: Get.context as BuildContext, builder: (context){
      return const Center(child: CircularProgressIndicator());

    });

    final GoogleSignInAccount? User = await Inst.signIn();

    GoogleSignInAuthentication? GoogleTokens = await User?.authentication;

    final AuthCredential credential =GoogleAuthProvider.credential(
      idToken:GoogleTokens?.idToken,
      accessToken:GoogleTokens?.accessToken
    );
    await auth.signInWithCredential(credential);

    box.write('Token', credential.toString());

    credential!=null ? Get.offAll(()=> Home()) : Get.offAll(()=> loginPage());

  }

   loginWithemailAndpassword({emailAddress , password }) async{

     showDialog(context: Get.context as BuildContext, builder: (context){
       return const Center(child: CircularProgressIndicator());

     });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      box.write('emailToken', credential);

      credential!=null ? Get.offAll(()=> Home()) : Get.offAll(()=> loginPage());

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Text('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Text('Wrong password provided for that user.');
      }
    }


  }


}