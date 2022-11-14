import 'package:code_kata_demo/res/color_helper.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  final String userName;
  final String pwd;

  const MyProfile({super.key, required this.userName, required this.pwd});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('My Profile'),
      ),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(children: [
                const Text('Username'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.pwd,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      hintText: "Phone", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/lifecycle',
                        arguments: phoneController.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text(
                      "Click me",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
