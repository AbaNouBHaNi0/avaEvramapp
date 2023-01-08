import 'package:auth_with_get/Shared/Components.dart';
import 'package:auth_with_get/ViewModels/FireStoreViewModel.dart';
import 'package:auth_with_get/Views/Content/Add_account_Form.dart';
import 'package:auth_with_get/Views/Content/Delete%20_account.dart';
import 'package:auth_with_get/Views/Content/Golden_badge.dart';
import 'package:auth_with_get/Views/Content/Weakly_Attendance.dart';
import 'package:auth_with_get/Views/Content/update_Personal_data.dart';
import 'package:auth_with_get/Views/Content/seeAllaccounts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends GetWidget<FireStoreViewModel> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "اهلا بيك فى تطبيق خدمه الانبا ابرام",
          style: TextStyle(color: Colors.black, fontFamily: "Arial"),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.logout),
            onPressed: ()  {
              controller.GoogleSignoutMethod();
            }

          )
        ],
      ),
      body:
      Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              ///
              const SizedBox(height: 10),

              ///
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //primary: false,
                  padding: const EdgeInsets.all(25),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    ///Add account
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 109, 233, 220)),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person_add_alt_1,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "اضافه مخدوم", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Add_account()));
                        },
                      ),
                    ),

                    ///Take Attendance
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 184, 243, 184)),
                      height: MediaQuery.of(context).size.height * .2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.touch_app_sharp,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "حضور اليوم", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Weakly_Attendace()));
                        },
                      ),
                    ),

                    ///goldenBadge
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 238, 163, 225)),
                      height: MediaQuery.of(context).size.height * .2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.star,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "المواظبه", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const goldenBadge()));
                        },
                      ),
                    ),

                    ///Update Account Data
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 249, 163)),
                      height: MediaQuery.of(context).size.height * .2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "تعديل بيانات", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const updatePersonaldata()));
                        },
                      ),
                    ),

                    ///delete account
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 250, 185, 147)),
                      height: MediaQuery.of(context).size.height * .2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.delete,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "حذف مخدوم", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const deleteAccount()));
                        },
                      ),
                    ),

                    ///Show list of accounts
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 252, 108, 108)),
                      height: MediaQuery.of(context).size.height * .2,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.supervisor_account,
                                size: 35,
                              ),
                            ),
                            DefaultText(content: "عرض الكل", Size: 20.0,)
                          ],
                        ),
                        onTap: () {
                          controller.getAllUsers(collectionId: 'users');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>const seeAlldata()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),



    );
  }
}
