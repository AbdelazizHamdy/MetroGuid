import 'package:flutter/material.dart';

class MetroMap extends StatelessWidget {
  const MetroMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          elevation: 20.0,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Metro Lines Map'),
        ),
        body: Center(
            child: Column(
              children: [
                Image.asset('assets/images/metroMap.jpeg',
                    fit:BoxFit.fitHeight, ),
              ],
            ),
        ),
      ),
    );
  }
}
