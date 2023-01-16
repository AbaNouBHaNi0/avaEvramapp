import 'package:auth_with_get/Models/UserModel.dart';
import 'package:flutter/material.dart';

class accountpage extends StatelessWidget {
  accountpage({Key? key, required this.user}) : super(key: key);
  final user;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children  : [
    //       const CircleAvatar(child: Icon(Icons.person),),
    //       Text('Name:${user['full_name']}'),
    //       Text('Phone:${user['phone_number']}'),
    //       Text('Zone: ${user['Zone']}'),
    //       Text('Bith_date: ${user['bithDate']}'),
    //       Text('Added_By:${user['added_by']}'),
    //       Text('Attendance: ${user['Num_of_attendance']}'),
    //     ],
    //   ),
    // );

    return Scaffold(

      backgroundColor:  Colors.cyan,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const CircleAvatar(
              radius: 50.0,
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: 20.0,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
                title: Text(
                  'Name:  ${user['full_name']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  'Phone:${user['phone_number']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.teal,
                ),
                title: Text(
                  'Zone: ${user['Zone']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.date_range,
                  color: Colors.teal,
                ),
                title: Text(
                  'Bith_date: ${user['bithDate']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.perm_identity_sharp,
                  color: Colors.teal,
                ),
                title: Text(
                  'Added_By:${user['added_by']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.assessment_sharp,
                  color: Colors.teal,
                ),
                title: Text(
                  'Attendance: ${user['Num_of_attendance']}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
