import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherPage extends StatefulWidget {
  TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  String myusertype = '', name = '', email = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      myusertype = sp.getString('usertype') ?? '';
      name = sp.getString('name') ?? '';
      email = sp.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Teacher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Type'),
                  Text(myusertype.toString()),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Name'),
                  Text(name.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
