import 'package:flutter/material.dart';
import 'package:metro_guid/logic/metro_lines.dart';
import 'package:timelines/timelines.dart';

class RouteView extends StatelessWidget {
  final List<Stations> stations;
    const RouteView(  {Key? key, required this.stations,}) : super(key: key);

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
              Container(
                height: height * 1,
                width: width * 1,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: const Text(
                        'Your Route',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.yellow.shade800,
                      height: 45,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Number of Stations: ${stations.length}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      // height: MediaQuery.of(context).size.height * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Timeline.tileBuilder(
                          shrinkWrap: true,
                          theme: TimelineThemeData.raw(
                            direction: Axis.vertical,
                            color: Colors.yellow,
                            nodePosition: 0.8,
                            indicatorPosition: 0.5,
                            indicatorTheme: IndicatorTheme.of(context),
                            connectorTheme: const ConnectorThemeData(color: Colors.blue,thickness: 5.0,),
                            nodeItemOverlap: false,
                          ),
                          builder: TimelineTileBuilder.fromStyle(
                            contentsAlign: ContentsAlign.reverse,
                            addRepaintBoundaries: true,
                            contentsBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child:  Text(stations[index].name!,
                                style: const TextStyle(
                                  color: Color(0xFFF9A825),
                                  textBaseline: TextBaseline.alphabetic,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            itemCount: stations.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}