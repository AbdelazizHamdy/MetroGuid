import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metro_guid/cubit/app_cubit.dart';
import 'package:metro_guid/logic/metro_lines.dart';
import 'package:metro_guid/view/widgets/metro_map.dart';
import 'package:metro_guid/view/widgets/route_stations_view.dart';
import 'package:metro_guid/view/widgets/settings.dart';
import 'package:metro_guid/view/widgets/tickets_costs.dart';
import 'package:metro_guid/view/widgets/from_station_home.dart';
import 'package:metro_guid/view/widgets/to_stations.dart';
import '../logic/line_1_repo.dart';

class MetroHome extends StatefulWidget {
   const MetroHome(  {Key? key,}) : super(key: key);

  @override
  State<MetroHome> createState() => _MetroHomeState();
}

class _MetroHomeState extends State<MetroHome> {
  var formKey = GlobalKey<FormState>();
   TextEditingController fromController = TextEditingController();
   TextEditingController toController = TextEditingController();
   late List<Stations> stations;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.deepOrange,
        title:  Text('Metro'.tr().toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings)
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
                Image.asset('assets/images/logo.png',width: width * 0.7,height: height * 0.2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('From'.tr().toString(),
                        style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                      ),
                       SizedBox(
                        width: width * 0.01,
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.05,
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
                            style: Theme.of(context).textTheme.bodyText1
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
                 SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text('To    '.tr().toString(),
                        style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                      ),
                       SizedBox(
                        width: width *.03,
                      ),
                      Expanded(
                        child: Container(
                          height: height * .05,
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
                            style: Theme.of(context).textTheme.bodyText1
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
                 SizedBox(
                  height: height * 0.025,
                ),
                TextButton(
                  onPressed: ()
                  {
                      stations = StationsLine1Repo.getDirectionsAllLines(
                          fromController.text, toController.text);
                      print('Number of Stations ${stations.length}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteView(stations: stations,),
                        ),
                      );

                  },
                  child:  Text(
                    "Get Direction".tr().toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                 SizedBox(
                  height: height * .025,
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
                        height: height * 0.12,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepOrange,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Icon(
                                Icons.map,
                                size: 40,
                                color: Colors.white,
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                             Text(
                              'Metro Map'.tr().toString(),
                              style: const TextStyle(
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
                        height: height * 0.12,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepOrange,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Icon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.white,
                              size: 37,
                            ),
                            SizedBox(
                              height: height * 0.009,
                            ),
                             Text(
                              'Tickets Price'.tr().toString(),
                              style: const TextStyle(
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
                 SizedBox(
                  height: height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Text(
                      'Tip:'.tr().toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                     Text(
                      'Press '.tr().toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.05,
                      child: Image.asset('assets/images/myLocationIcon.png',),
                    ),
                     Text(
                      ' to get your nearest Metro Station.'.tr().toString(),
                      style: Theme.of(context).textTheme.bodyText1,
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
