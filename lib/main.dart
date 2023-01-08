import 'package:auth_with_get/Helper/binding.dart';
import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/Views/Home_page.dart';
import 'package:auth_with_get/Views/authViews/loginPage.dart';
import 'package:auth_with_get/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
var view;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
   if(box.read('Token') == null || box.read('emailToken') == null){
     view =  loginPage();
   }
   else{
     view =  Home();
   }
  runApp( const MyApp());
}
/// to Build :  flutter build apk --split-per-abi. after Flutter Clean.

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: binding(),
      title: 'Auth With get',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: view,
    );
  }
}

