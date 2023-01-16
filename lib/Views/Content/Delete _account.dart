import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/ViewModels/deleteUserviewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
var deleteController = TextEditingController();
class deleteAccount extends GetWidget<deleteUserviewModel> {
  deleteAccount({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'حذف مخدوم',
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Center(
              child: SingleChildScrollView(
            child: Column(children: [
              const Text(
                'حذف مخدوم',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  width: 90,
                  child: const Divider(
                    height: 5,
                    color: Colors.transparent,
                  )),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [Shadow(Colors.black54)],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            ///name input
                            TEXTINPUTE(
                              Controller: deleteController,
                              icon: Icons.person,
                              keyBoard: TextInputType.text,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              Hint: "الاسم كامل",
                              Validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الاسم غير موجود';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        // Validate returns true if the form is valid, or false otherwise.
                                        if (_formKey.currentState!.validate())
                                        {
                                          controller.deleteUser(name: deleteController.text , context: context);
                                        }
                                      },
                                      child: const Text('حذف' ,style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontFamily: "Timesnewroman"),),
                                    ),
                                  ),
                                ))

                          ]))))
            ]),
          )),
        ));
  }
}
