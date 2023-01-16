import 'package:auth_with_get/Views/Content/accountPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class seeAlldata extends StatelessWidget {
   seeAlldata({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context ,{int number = 0}) {
    return Scaffold(
      appBar:  AppBar (title:  const Text('عرض كل المخدومين الفصل') ,centerTitle: true,),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          return ListView(
              children: snapshot.data.docs.map<Widget>(
                      (document) {
              number++;
            return InkWell(
              onTap: (){
                Get.off(()=>  accountpage(user: document,));
              },
              child: Center(
                child: ListTile(
                  leading: Text(number.toString()),
                  title: Text(document['full_name']),
                  subtitle:  Text(document['phone_number']),
              ),
          ),

            );

        }).toList());
      },
    ));
  }
}
