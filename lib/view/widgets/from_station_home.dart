import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:metro_guid/logic/line_1_repo.dart';
import 'package:timelines/timelines.dart';
import '../../logic/line_2_repo.dart';
import '../../logic/line_3_repo.dart';

class FromStations extends StatelessWidget {
   const FromStations( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
               Text('Choose a Start Station'.tr().toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 1.0,
                        top: 2.0,
                    ),
                    child: Container(
                      width: width * 0.457,
                      color: Colors.black54,
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child:  Center(
                              child: Text(
                                'Line 1'.tr().toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            color: Colors.yellow.shade800,
                            height: height * 0.05,
                            width: double.infinity,
                          ),
                          Container(
                            height: height * 0.847,
                            child: Timeline.tileBuilder(
                              shrinkWrap: true,
                              theme: TimelineThemeData.raw(
                                direction: Axis.vertical,
                                color: Colors.yellow,
                                nodePosition: 0.8,
                                indicatorPosition: 0.5,
                                indicatorTheme: IndicatorTheme.of(context),
                                connectorTheme: const ConnectorThemeData(
                                  color: Colors.blue,
                                  thickness: 5.0,
                                ),
                                nodeItemOverlap: false,
                              ),
                              builder: TimelineTileBuilder.fromStyle(
                                contentsAlign: ContentsAlign.reverse,
                                addRepaintBoundaries: true,
                                contentsBuilder: (context, index) =>  Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child:  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,StationsLine1Repo.line1.stations[index].name,
                                      );
                                    },
                                    child: Text(StationsLine1Repo.line1.stations[index].name!,
                                      style: const TextStyle(
                                          color: Color(0xFFF9A825),
                                        textBaseline: TextBaseline.alphabetic,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: StationsLine1Repo.line1.stations.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 1.0,
                          top: 2.0,
                        ),
                        child: Container(
                          width: width * 0.457,
                          color: Colors.black54,
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child:  Center(
                                  child: Text(
                                    'Line 2'.tr().toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                color: Colors.yellow.shade800,
                                height: height * 0.05,
                                width: double.infinity,
                              ),
                              Container(
                                height: height * 0.847,
                                child: Timeline.tileBuilder(
                                  shrinkWrap: true,
                                  theme: TimelineThemeData.raw(
                                    direction: Axis.vertical,
                                    color: Colors.yellow,
                                    nodePosition: 0.8,
                                    indicatorPosition: 0.5,
                                    indicatorTheme: IndicatorTheme.of(context),
                                    connectorTheme: const ConnectorThemeData(
                                        color: Colors.red,
                                        thickness: 5.0,
                                    ),
                                    nodeItemOverlap: false,
                                  ),
                                  builder: TimelineTileBuilder.fromStyle(
                                    contentsAlign: ContentsAlign.reverse,
                                    addRepaintBoundaries: true,
                                    contentsBuilder: (context, index) =>  Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child:  TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                            context,StationsLine2Repo.line2.stations[index].name,
                                          );
                                        },
                                        child: Text(StationsLine2Repo.line2.stations[index].name!,
                                          style: const TextStyle(
                                            color: Color(0xFFF9A825),
                                            textBaseline: TextBaseline.alphabetic,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemCount: StationsLine2Repo.line2.stations.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 1.0,
                          top: 2.0,
                        ),
                        child: Container(
                          width: width * 0.457,
                          color: Colors.black54,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child:   Center(
                                  child: Text(
                                    'Line 3'.tr().toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                color: Colors.yellow.shade800,
                                height: height * 0.05,
                                width: double.infinity,
                              ),
                              Container(
                                height: height * 0.847,
                                child: Timeline.tileBuilder(
                                  shrinkWrap: true,
                                  theme: TimelineThemeData.raw(
                                    direction: Axis.vertical,
                                    color: Colors.yellow,
                                    nodePosition: 0.8,
                                    indicatorPosition: 0.5,
                                    indicatorTheme: IndicatorTheme.of(context),
                                    connectorTheme: const ConnectorThemeData(
                                        color: Colors.green,
                                        thickness: 5.0,
                                    ),
                                    nodeItemOverlap: false,
                                  ),
                                  builder: TimelineTileBuilder.fromStyle(
                                    contentsAlign: ContentsAlign.reverse,
                                    addRepaintBoundaries: true,
                                    contentsBuilder: (context, index) =>  Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child:  TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                            context,StationsLine3Repo.line3.stations[index].name,
                                          );
                                        },
                                        child: Text(StationsLine3Repo.line3.stations[index].name!,
                                          style: const TextStyle(
                                            color: Color(0xFFF9A825),
                                            textBaseline: TextBaseline.alphabetic,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemCount: StationsLine3Repo.line3.stations.length,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
