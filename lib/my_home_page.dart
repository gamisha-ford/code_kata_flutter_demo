import 'package:code_kata_demo/res/color_helper.dart';
import 'package:code_kata_demo/my_profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  child: const Image(image: AssetImage('assets/ford-logo.png')),
                ),
              ),
              const SizedBox(height: 20),
              const Text("SIGN IN", style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                      "Please enter the email and password to our Ford or Lincoln account.")),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login Success!")));
                        Navigator.pushNamed(context, '/profile',
                            arguments: MyProfile(
                                userName: usernameController.text,
                                pwd: passwordController.text));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Forgot Password?"),
                        Icon(
                          Icons.chevron_right,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 1,
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width * 0.6),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Create Account"),
                        Icon(
                          Icons.chevron_right,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
