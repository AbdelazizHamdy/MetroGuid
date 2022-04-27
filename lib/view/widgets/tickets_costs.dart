import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_guid/view/widgets/to_stations.dart';
import '../../cubit/quantity_cubit.dart';
import 'from_station.dart';

class TicketsCosts extends StatefulWidget {
  const TicketsCosts({Key? key}) : super(key: key);

  @override
  State<TicketsCosts> createState() => _TicketsCostsState();
}

class _TicketsCostsState extends State<TicketsCosts> {
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
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Tickets Price'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('From'),
                const SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  FromStations(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
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
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('To '),
                const SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ToStations(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
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
                ),
              ],
            ),
          ),
              const SizedBox(height: 20,),
              const Text(
                'How Many Tickets you need',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: ()
                      {
                        if(ticketsNum! > 1) {
                          _decrementQuantity();
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Container(
                      width: 180,
                      height: 50,

                      child: BlocBuilder<QuantityCubit , QuantityState>(
                          bloc: _quantityCubit,
                          builder: (context, state) {
                            ticketsNum = state.quantity;
                            return Text(
                              state.quantity.toString(),
                              style: Theme.of(context).textTheme.headline5,
                              textAlign:TextAlign.center ,
                            );
                          }
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        _incrementQuantity();
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ]
              ),
              const SizedBox(height: 20,),

              TextButton(
                onPressed: (){},
                child: const Text('Calculate',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrangeAccent,
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text(
                    'It Costs :',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    width: 20,
                    height: 20,
                    child: const Text(''),
                  ),
                ],
              ),
        ]),
      ),
    );
  }
}
