import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/ViewModels/updateUserviewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Weakly_Attendace extends GetWidget<updateUserviewModel> {
  Weakly_Attendace({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, {int number = 0}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الغياب الاسبوعى'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data.docs.map<Widget>((document) {
            number++;
            return InkWell(
              onTap: () {},
              child: Center(
                child: Obx(
                  () => CheckboxListTile(
                    title: Text(document['full_name']),
                    subtitle: Text(document['phone_number']),
                    checkColor: Colors.white,
                    activeColor: Colors.blueGrey,
                    controlAffinity: ListTileControlAffinity.leading,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: controller.selected.value == 1,
                    onChanged: (val) {
                      val ?? true
                          ? controller.selected.value = 1
                          : controller.selected.value = null;
                    },
                  ),
                ), //CheckboxListTile
              ),
            );
          }).toList());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
