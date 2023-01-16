import 'package:auth_with_get/Models/UserModel.dart';
import 'package:auth_with_get/Views/authViews/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

Map? dataMap;
class addUserviewModel extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void googleSignout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() =>  loginPage());
  }

   addUser({UserModule? data , required collectionName }) async {
     final users = FirebaseFirestore.instance.collection(collectionName).doc(data!.fullName);
     // Call the user's CollectionReference to add a new user
     final UserData = {
       'full_name': data.fullName,
       'phone_number': data.phoneNumber,
       'bithDate': data.bithDate, // Stokes and Sons
       'Zone': data.Zone,
       'added_by': data.Added_by,
       'Num_of_attendance': 0 // 42
     };
     await users.set(UserData);
   }



  addnamedUser() async {
   final docUser = FirebaseFirestore.instance.collection('users').doc('abanoub');
   final snapshot = await  docUser.get();
  }


}
