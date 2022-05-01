import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metro_guid/logic/metro_lines.dart';
import 'package:metro_guid/view/widgets/metro_map.dart';
import 'package:metro_guid/view/widgets/route_stations_view.dart';
import 'package:metro_guid/view/widgets/tickets_costs.dart';
import 'package:metro_guid/view/widgets/from_station_home.dart';
import 'package:metro_guid/view/widgets/to_stations.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../logic/line_1_repo.dart';

class MetroHome extends StatefulWidget {
   const MetroHome(  {Key? key,}) : super(key: key);

  @override
  State<MetroHome> createState() => _MetroHomeState();
}

class _MetroHomeState extends State<MetroHome> {
   TextEditingController fromController = TextEditingController();
   TextEditingController toController = TextEditingController();
   late List<Stations> stations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.deepOrange,
        title: const Text('Metro'),
        actions: [
          ToggleSwitch(
            minWidth: 50.0,
            minHeight: 5.0,
            initialLabelIndex: 1,
            cornerRadius: 100.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            labels: const ['Eng', 'AR'],
            activeBgColors: const [
              [Colors.deepOrange],
              [Colors.deepOrange]
            ],
            onToggle: (index) {
              print('switched to: $index');
              // changeLanguage(index!);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('From',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                            ),
                              readOnly: true,
                              controller: fromController,
                              onTap: ()async
                              {
                                final String stationName = await
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const FromStations(),
                            ),
                          );
                                fromController.text = stationName;
                          },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // getCurrentLocation();
                        },
                        icon: const Icon(
                            Icons.my_location,
                            color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('To ',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          child: TextFormField(
                              readOnly: true,
                              controller: toController,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                              ),
                              onTap: ()async
                              {
                                final String stationName = await
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  const ToStations(),
                                  ),
                                );
                                toController.text = stationName;
                              },
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                              ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: ()
                  {
                    // List<Stations>
                     stations = StationsLine1Repo.getDirectionsAllLines(fromController.text, toController.text);
                    print('Number of Stations ${stations.length}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  RouteView(stations: stations,),
                      ),
                    );
                  },
                  child: const Text(
                    "Get Direction",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MetroMap(),
                          ),
                        );
                      },
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepOrange,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                                Icons.map,
                                size: 40,
                                color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Metro Map',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const TicketsCosts(),
                          ),
                        );
                      },
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepOrange,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.white,
                              size: 37,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tickets Price',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Tip:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Press ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/myLocationIcon.png'),
                    ),
                    const Text(
                      ' to get your nearest Metro Station.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
