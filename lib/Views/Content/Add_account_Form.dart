import 'package:auth_with_get/Models/UserModel.dart';
import 'package:auth_with_get/ViewModels/FireStoreViewModel.dart';
import 'package:auth_with_get/Views/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Add_account extends  GetWidget<FireStoreViewModel> {
   Add_account({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  var fullName = TextEditingController();
  var Zone = TextEditingController();
  var bithDate = TextEditingController();
  var phoneNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, centerTitle: true,title: const Text('أضافه مخدوم' , style: TextStyle(color: Colors.black),),),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              ///nameInput
              TextFormField(
                controller: fullName,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: "الاسم كامل"
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الاسم غير موجود';
                  }
                  return null;
                },
              ),
              ///ZoneInput
              TextFormField(
                controller: Zone,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: "العنوان"
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'العنوان غير موجود';
                  }
                  return null;
                },
              ),
              ///PhoneInput
              TextFormField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                  labelText: "رقم الهاتف"
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'رقم الهاتف غير موجود';
                  }
                  return null;
                },
              ),
              ///bithDate
              TextFormField(
                controller: bithDate,
                decoration: const InputDecoration(
                  labelText: "تاريخ الميلاد"
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'تاريخ الميلاد غير موجود';
                  }
                  return null;
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {

                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم اضافه المخدوم شكرا')),
                        );
                        controller.addUser(
                          docName: 'users',
                            data: UserModule( Zone.text, bithDate.text, phoneNumber.text, fullName.text)
                        );
                        Get.offAll(()=> const Home());
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
    ) ;

  }
}

