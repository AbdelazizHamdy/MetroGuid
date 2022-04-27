import 'package:flutter/material.dart';
import '../../logic/line_1_repo.dart';
import '../../logic/line_2_repo.dart';
import '../../logic/line_3_repo.dart';
import '../metro_home_screen.dart';

class FromStations extends StatelessWidget {
   const FromStations({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Select your Start'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.5,
                color: Colors.deepOrangeAccent,
                child: Column(
                  children: [
                    const Text(
                      'Line 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: StationsLine1Repo.line1.stations.length,
                        itemBuilder: (BuildContext context, int index) =>
                            TextButton(
                             onPressed: () {

                               StationsLine1Repo.line1.stations[index].name;
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MetroHome( ),
                                  // StationsLine1Repo.line1.stations[index],

                              ),
                            );
                          },
                            child: Text(
                              StationsLine1Repo.line1.stations[index].name!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: width * 0.5,
                    color: Colors.deepOrangeAccent,
                    child: Column(
                      children: [
                        const Text(
                          'Line 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: StationsLine2Repo.line2.stations.length,
                            itemBuilder: (BuildContext context, int index) =>
                                TextButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MetroHome(),
                                    // StationsLine2Repo.line2.stations[index],

                                  ),
                                );
                              },
                                child: Text(StationsLine2Repo.line2.stations[index].name!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.5,
                    color: Colors.deepOrangeAccent,
                    child: Column(
                      children: [
                        const Text(
                          'Line 3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: StationsLine3Repo.line3.stations.length,
                            itemBuilder: (BuildContext context, int index) =>
                                TextButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MetroHome(),
                                    // StationsLine3Repo.line3.stations[index],
                                  ),
                                );
                              },
                                  child: Text(StationsLine3Repo.line3.stations[index].name!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
