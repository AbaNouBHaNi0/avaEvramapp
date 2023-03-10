import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/Views/authViews/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../ViewModels/AuthViewModel.dart';

bool hide = true;
var passwordController = TextEditingController();
var fullname = TextEditingController();

class Registration extends GetWidget<AuthViewModel> {
  Registration({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
              const Text(
                'Registration',
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
                        TEXTINPUTE(
                          icon: Icons.person,
                          keyBoard: TextInputType.text,
                          Controller: fullname,
                          textAlign: TextAlign.left,
                          Hint: "Full Name",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TEXTINPUTE(
                          icon: Icons.email,
                          keyBoard: TextInputType.emailAddress,
                          Controller: emailController,
                          textAlign: TextAlign.left,
                          Hint: "Email",
                          Validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(()=>
                           TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscuringCharacter: "*",
                            obscureText: controller.isPasswordhidden.value,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  controller.isPasswordhidden.value=
                                  !controller.isPasswordhidden.value;
                                },
                              ),
                              labelText: "Enter password",
                              //icon:  Icon(Icons.lock),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),

                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(()=>
                           TextFormField(
                            validator: (value) {
                              if (value.toString() != passwordController.text ||
                                  value == null ||
                                  value.isEmpty) {
                                return 'Re enter the password correctly';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscuringCharacter: "*",
                            obscureText: controller.isPasswordhidden.value,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  controller.isPasswordhidden.value=
                                  !controller.isPasswordhidden.value;
                                },
                              ),
                              labelText: "Re-Enter password",
                              //icon:  Icon(Icons.lock),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),

                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.createUserwithEmailandPassword(
                                    name: fullname.text,
                                    emailAddress: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child:  Text("REGISTER",
                                style: textStyle()),
                          ),
                        )
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
