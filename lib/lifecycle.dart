import 'package:code_kata_demo/res/color_helper.dart';
import 'package:flutter/material.dart';

class Lifecycle extends StatefulWidget {
  final String value;

  const Lifecycle({super.key, required this.value});

  @override
  State<Lifecycle> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  int counter = 0;

  void getData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      print('Joseph Smith');
    });

    Future.delayed(const Duration(seconds: 2), () {
      print('This is Joseph\'s bio');
    });

    print('statement');
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Lifecycle'),
      ),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'Counter is $counter',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.value),
              ]),
            ),
          ),
        ]),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose function ran');
  }
}
