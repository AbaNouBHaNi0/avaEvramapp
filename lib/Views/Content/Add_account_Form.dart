import 'package:auth_with_get/Models/UserModel.dart';
import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/ViewModels/addUserviewMoudel.dart';
import 'package:auth_with_get/Views/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class addAccount extends GetWidget<addUserviewModel> {
  addAccount({Key? key} ) : super(key: key);

  var imageUrl;

  final injection = AuthViewModel();
  final _formKey = GlobalKey<FormState>();
  var fullName = TextEditingController();
  var zone = TextEditingController();
  var bithDate = TextEditingController();
  var phoneNumber = TextEditingController();
  final ImagePicker _picker = ImagePicker();

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

                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                        ///name input
                          TEXTINPUTE(
                          icon:  Icons.person,
                          keyBoard:  TextInputType.text,
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
                        const SizedBox(
                          height: 15,
                        ),
                        ///address input
                        TEXTINPUTE(
                          icon: Icons.location_on_outlined,
                          keyBoard: TextInputType.text,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          Controller: zone,
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
                          icon: Icons.phone_iphone_outlined,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          Controller: phoneNumber,
                          Hint: "رقم الهاتف",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'رقم الهاتف غير موجود';
                            }
                            return null;
                          }, keyBoard: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        ///birth date
                        TEXTINPUTE(
                          icon: Icons.date_range_outlined,
                          keyBoard: TextInputType.number,
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
                              child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('تم اضافه المخدوم شكرا')),
                                      );
                                       controller.addUser(
                                          collectionName: 'users',
                                          data: UserModule(
                                              zone.text,
                                              bithDate.text,
                                              phoneNumber.text,
                                              fullName.text,
                                              box.read('username').toString(),
                                              ''

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
