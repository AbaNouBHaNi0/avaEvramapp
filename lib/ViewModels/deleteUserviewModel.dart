import 'package:auth_with_get/Views/Home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var documentID;

class deleteUserviewModel extends GetxController
{
   deleteUser({name , context}) async {
     DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(name).get();

    if (document.exists){
      showDialog(context: Get.context as BuildContext, builder: (context){
        return const Center(child: CircularProgressIndicator());
      });

      await FirebaseFirestore.instance.collection('users').doc(name).delete();
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
              content:
              Text('تم حذف المخدوم شكرا')),
        );

      Get.offAll(()=> const Home());
      return true;
    }
    else
      {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
              content:
              Text('حاول تانى')),
        );

      }

  }

}