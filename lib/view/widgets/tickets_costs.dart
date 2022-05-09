import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_guid/view/widgets/to_stations.dart';
import '../../cubit/quantity_cubit.dart';
import '../../logic/line_1_repo.dart';
import '../../logic/metro_lines.dart';
import 'from_station_home.dart';

class TicketsCosts extends StatefulWidget {

   const TicketsCosts({Key? key,}) : super(key: key);


  @override
  State<TicketsCosts> createState() => _TicketsCostsState();
}
class _TicketsCostsState extends State<TicketsCosts> {
  List<Stations> targetedStations = [];
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController routeStations = TextEditingController();
  int? ticketsNum = 1;
  QuantityCubit? _quantityCubit;
  int? ticketsCosts;

  @override
  void initState() {
    // TODO: implement initState
    _quantityCubit = QuantityCubit();
    super.initState();
  }
  void _incrementQuantity() {
    _quantityCubit!.increaseQuantity();
  }
  void _decrementQuantity() {
    _quantityCubit!.decreaseQuantity();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  children: [
                    Image.asset('assets/images/cover_logo.png',
                      width: width * 0.9,
                      height: height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('From'.tr().toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                            ),),
                           SizedBox(
                            width: width * 0.02,
                          ),
                          Expanded(
                            child: Container(
                              height: height * 0.058,
                              width: double.infinity,
                              child: TextFormField(
                                readOnly: true,
                                controller: fromController,
                                decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                ),
                                onTap: () async {
                                  final String stationName = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FromStations(),
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
                            ),),
                           SizedBox(
                            width: width * 0.02,
                          ),
                          Expanded(
                            child: Container(
                              height: height * 0.058,
                              width: double.infinity,
                              child: TextFormField(
                                readOnly: true,
                                controller: toController,
                                decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                ),
                                onTap: () async {
                                  final String stationName = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ToStations(),
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
                      height: height * 0.03,
                    ),

                    Row(
                      children: [
                         Text(
                          'Number of Stations: '.tr().toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                         SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          height: height * 0.05,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(15),
                              right: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              targetedStations.length.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: height * 0.02,
                    ),
                     Text(
                      'How Many Tickets you need'.tr().toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                     SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (ticketsNum! > 1) {
                                _decrementQuantity();
                              }
                            },
                            icon: const Icon(Icons.arrow_back_ios,color: Colors.deepOrange),
                          ),
                          Container(
                            width: width * 0.2,
                            height: height * 0.05,
                            child: BlocBuilder<QuantityCubit, QuantityState>(
                                bloc: _quantityCubit,
                                builder: (context, state) {
                                  ticketsNum = state.quantity;
                                  return Text(
                                    state.quantity.toString(),
                                    style: Theme.of(context).textTheme.subtitle1,
                                    textAlign: TextAlign.center,
                                  );
                                }),
                          ),
                          IconButton(
                            onPressed: () {
                              _incrementQuantity();
                            },
                            icon: const Icon(Icons.arrow_forward_ios,color: Colors.deepOrange),
                          ),
                        ]),
                     SizedBox(
                      height: height * 0.02,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          targetedStations = StationsLine1Repo.getDirectionsAllLines(fromController.text, toController.text);
                          print(targetedStations.length);
                          print(ticketsNum! * priceOfTickets( targetedStations.length, ticketsCosts, ticketsNum!));
                        });

                        // setState(() {
                        //   priceOfTickets(targetedStations.length, ticketsNum!);
                        //
                        // });
                      },
                      child:  Text(
                        'Calculate'.tr().toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),

                     SizedBox(
                      height: height *0.02,
                    ),
                    Row(
                      children: [
                         Text(
                          'It Costs:'.tr().toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                         SizedBox(
                          width: width * 0.02,
                        ),
                         Text(
                          '${ ticketsNum! * priceOfTickets( targetedStations.length, ticketsCosts, ticketsNum!)}  EGP ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }


// price of the tickets = Number of stations =< 9 = 3
// price of the tickets = Number of stations =< 16 = 5
// price of the tickets = Number of stations => 17 = 7

  priceOfTickets(int? numberOfStations, int? numberOfTickets,int ticketsCosts) {
    int cost;
    int numberOfTickets = ticketsNum!;
    numberOfStations = targetedStations.length;

    if (numberOfStations < 9) {
      return cost = 3;
    } else if (numberOfStations < 16) {
      return cost = 5;
    } else {
      return cost = 7;
    }
    ticketsCosts = cost * ticketsNum!;
  }
}