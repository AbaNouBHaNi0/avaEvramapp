import 'package:auth_with_get/ViewModels/AuthViewModel.dart';
import 'package:auth_with_get/ViewModels/addUserviewMoudel.dart';
import 'package:auth_with_get/ViewModels/deleteUserviewModel.dart';
import 'package:get/get.dart';

class binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AuthViewModel());
   Get.lazyPut(() => addUserviewModel());
   Get.lazyPut(() => deleteUserviewModel());
  }

}