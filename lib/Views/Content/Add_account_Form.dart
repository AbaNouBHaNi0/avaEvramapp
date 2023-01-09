import 'package:auth_with_get/Models/UserModel.dart';
import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/ViewModels/FireStoreViewModel.dart';
import 'package:auth_with_get/Views/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Add_account extends GetWidget<FireStoreViewModel> {
  Add_account({Key? key} ) : super(key: key);
  final injection = AuthViewModel();
  final _formKey = GlobalKey<FormState>();
  var fullName = TextEditingController();
  var Zone = TextEditingController();
  var bithDate = TextEditingController();
  var phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: const Color.fromARGB(30000, 0, 17, 101)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'أضافه مخدوم',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'اضافه مخدوم',
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

                  /// login With email And password
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ///name input
                        TEXTINPUTE(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          Controller: fullName,
                          Hint: "الاسم كامل",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الاسم غير موجود';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        ///address input
                        TEXTINPUTE(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          Controller: Zone,
                          Hint: "العنوان",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'العنوان غير موجود';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// phone input
                        TEXTINPUTE(
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          Controller: phoneNumber,
                          Hint: "رقم الهاتف",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'رقم الهاتف غير موجود';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        ///birth date
                        TEXTINPUTE(
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          Controller: bithDate,
                          Hint: "تاريخ الميلاد",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تاريخ الميلاد غير موجود';
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
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('تم اضافه المخدوم شكرا')),
                                      );
                                      controller.addUser(
                                          docName: 'users',
                                          data: UserModule(
                                              Zone.text,
                                              bithDate.text,
                                              phoneNumber.text,
                                              fullName.text,
                                              box.read('username').toString(),

                                          )

                                          );
                                      Get.offAll(() => const Home());
                                    }
                                  },
                                  child: const Text('تسجيل'),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
