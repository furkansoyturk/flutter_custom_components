import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/custom_form.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomForm()),
                );

              },
              child: Text('Form'),
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
