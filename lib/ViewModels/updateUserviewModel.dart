
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class updateUserviewModel extends GetxController
{
  final Rxn<int> selected = Rxn<int>();


  Future<void> updateUser({collectionId , docName , int? attendance })
  {
    CollectionReference users = FirebaseFirestore.instance.collection('');
    return users
        .doc(docName)
        .update({'Num_of_attendance': 1})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}