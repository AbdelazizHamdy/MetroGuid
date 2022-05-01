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
  double? width;
  double? height;
  double? newHeight;
  int? ticketsNum = 1;
  QuantityCubit? _quantityCubit;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: Colors.deepOrange,
        title: const Text('Tickets Price'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('To    ',
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
                    height: 20,
                  ),

                  Row(
                    children: [
                      const Text(
                        'Number of Stations: ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                            right: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          targetedStations.length.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'How Many Tickets you need',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (ticketsNum! > 1) {
                              _decrementQuantity();
                            }
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        Container(
                          width: 180,
                          height: 50,
                          child: BlocBuilder<QuantityCubit, QuantityState>(
                              bloc: _quantityCubit,
                              builder: (context, state) {
                                ticketsNum = state.quantity;
                                return Text(
                                  state.quantity.toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5,
                                  textAlign: TextAlign.center,
                                );
                              }),
                        ),
                        IconButton(
                          onPressed: () {
                            _incrementQuantity();
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      // List<Stations>
                      targetedStations =
                          StationsLine1Repo.getDirectionsAllLines(
                              fromController.text, toController.text);
                      print(targetedStations.length);
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'It Costs :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'ticketsNum * tickets price',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: const Text(''),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }


// price of the tickets = Number of stations =< 9 = 3
// price of the tickets = Number of stations =< 16 = 5
// price of the tickets = Number of stations => 17 = 7

  priceOfTickets(int numberOfStations, int priceOfTicket) {
    int? numberOfStations, priceOfTicket;
    int? cost;
    if (numberOfStations! < 9) {
      cost = 3;
    } else if (numberOfStations > 9 || numberOfStations < 16) {
      cost = 5;
    } else {
    cost = 7;
  }
    return cost;
  }
  // cost = Number of Tickets * price
  ticketsCost(int numberOfTickets, int priceOfTicket) {
    int? numberOfTickets = ticketsNum;
    int?  priceOfTicket, finalCost;

    finalCost = numberOfTickets! * priceOfTicket!;
  }

}