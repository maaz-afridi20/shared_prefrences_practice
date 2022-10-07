import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences_practice5/admin_page.dart';
// import 'package:shared_prefrences_practice5/home_page.dart';
import 'package:shared_prefrences_practice5/student_page.dart';
import 'package:shared_prefrences_practice5/teacher_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final agecontroller = TextEditingController();

  List<String> usertypess = ['student', 'teacher', 'admin'];
  String selecteduser = 'admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: agecontroller,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('name', namecontroller.text.toString());
                  sp.setString('email', emailcontroller.text.toString());
                  sp.setInt('age', int.parse(agecontroller.text));
                  sp.setBool('islogin', true);
                  // sp.setString('selectedusr', selecteduser.toString());

                  // user types i-e  admin,student,teacher

                  sp.setString('usertype', selecteduser.toString());

                  String userCheking = sp.getString('usertype') ?? '';

                  if (userCheking == 'teacher') {
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TeacherPage();
                      },
                    ));
                  } else if (userCheking == 'student') {
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Student();
                      },
                    ));
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminPage();
                      },
                    ));
                  }
                  //
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 40),
              DropdownButton(
                  value: selecteduser,
                  icon: const Icon(Icons.arrow_drop_down_circle),
                  // isExpanded: true, will add gap bw icon and text.
                  isDense: true,
                  iconSize: 20,
                  elevation: 24,
                  underline: const SizedBox(),
                  iconEnabledColor: Colors.green,
                  items: usertypess.map((String user) {
                    return DropdownMenuItem(
                      value: user,
                      child: Text(
                        user,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selecteduser = newValue!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}


// DropdownButton<String>(
//                 value: selecteduser,
//                 items: usertypess.map((String user) {
//                   return DropdownMenuItem<String>(
//                     value: user,
//                     child: Text(user),
//                   );
//                 }).toList(),
//                 onChanged: (String? newvalue) {
//                   setState(() {
//                     selecteduser = newvalue!;
//                   });
//                 },
//               ),