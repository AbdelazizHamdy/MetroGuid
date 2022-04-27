import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Directions extends StatelessWidget {
  const Directions( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Your direction'),
      ),
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,
          contentsBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text('Station name'),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
