import 'package:auth_with_get/Models/UserModel.dart';
import 'package:auth_with_get/Views/authViews/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

var list = [];
class FireStoreViewModel extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void GoogleSignoutMethod() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() =>  loginPage());
  }

  Future<void> addUser({UserModule? data, required String docName}) {
    CollectionReference users = FirebaseFirestore.instance.collection(docName);
    // Call the user's CollectionReference to add a new user

    return users
        .add({
          'phone_number': data!.phoneNumber,
          'bithDate': data.bithDate, // Stokes and Sons
          'Zone': data.Zone,
          'full_name': data.fullName,
          'Num_of_attendance': 0 // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future getAllUsers({
    required String collectionId,})
   async{


       firestore.collection(collectionId).get().then((value) => {
            value.docs.forEach ((result){
               result.data();
               print(result.data());

            }),
          });

  }
}
