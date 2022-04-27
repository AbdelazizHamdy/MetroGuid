import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metro_guid/logic/all_lines.dart';
import 'package:metro_guid/logic/metro_lines.dart';
import 'package:metro_guid/view/widgets/metro_map.dart';
import 'package:metro_guid/view/widgets/tickets_costs.dart';
import 'package:metro_guid/view/widgets/time_line_directions.dart';
import 'package:metro_guid/view/widgets/to_stations.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../logic/line_1_repo.dart';
import 'widgets/from_station.dart';

class MetroHome extends StatelessWidget {
   MetroHome(  {Key? key,}) : super(key: key);

   TextEditingController fromController = TextEditingController();
   TextEditingController toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Metro Cairo'),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('From',),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: TextFormField(
                          // readOnly: true,
                          controller: fromController,
                          onTap: ()
                          {
                      //       Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>  FromStations(),
                      //   ),
                      // );
                      }),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
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
                    icon: const Icon(Icons.my_location),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('To '),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      child: TextFormField(
                          // readOnly: true,
                          controller: toController,
                          onTap: ()
                          {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>  ToStations(),
                            //   ),
                            // );
                          }),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Directions( ),
                  ),
              );
                StationsLine1Repo.getDirectionsAllLines(fromController.text, toController.text);
              },
              child: const Text(
                "Get Direction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrangeAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.map),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Metro Map',
                          style: TextStyle(
                            fontSize: 16.0,
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
                        builder: (context) => const TicketsCosts(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepOrangeAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(FontAwesomeIcons.dollarSign),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Tickets Price',
                          style: TextStyle(
                            fontSize: 16.0,
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
    );
  }
}
