import 'package:flutter/material.dart';

class MetroMap extends StatelessWidget {
  const MetroMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Center(
            child: Column(
              children: [
                Container(
                  width: width * 1,
                  height: height * 0.9,
                  child: Image.asset(
                    'assets/images/metroMap.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
