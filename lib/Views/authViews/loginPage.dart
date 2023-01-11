import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/Views/authViews/Registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool hide = true;
var emailController = TextEditingController();
var passwordController = TextEditingController();

class loginPage extends GetWidget<AuthViewModel> {
   loginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('img/1.jpg'),
                  backgroundColor: Colors.white,
                  radius: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontFamily: 'arial',
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 10000,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Welcome to our App',
                          textAlign: TextAlign.center,
                        ),
                      ],
                      onTap: () {
                        //print("Tap Event");
                      },
                    ),
                  ),
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
                          ///Email Input
                          TEXTINPUTE(
                            icon: Icons.email,
                            keyBoard: TextInputType.emailAddress,
                            textAlign: TextAlign.left,
                            Validator: (value) {
                            if (value == null || value.isEmpty) {
                             return 'Enter a valid Email';
                            }
                            return null;
                            },
                            Hint: "Enter Email",
                            Controller: emailController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(()=>
                             TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscuringCharacter: "*",
                              obscureText: controller.isPasswordhidden.value,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the password';
                                }
                                return null;
                              },
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
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: () {

                                if (_formKey.currentState!.validate())
                                  {
                                       controller.loginWithemailAndpassword(
                                      emailAddress: emailController.text,
                                      password: passwordController.text);
                                  }


                              },
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontFamily: "Timesnewroman")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                ///registration Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.offAll(()=>  Registration());
                        },
                        child: const Text("Register now",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('OR'),

                      ///login With google
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.GoogleSignInMethod();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.login_sharp),
                              Text(
                                'Sign in With Google',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
