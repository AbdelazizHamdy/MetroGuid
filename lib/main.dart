import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:metro_guid/bloc/geolocation/geolocation_bloc.dart';
// import 'package:metro_guid/bloc/geolocation/geolocation_event.dart';
// import 'package:metro_guid/repo/geo_location/geo_location_repo.dart';
import 'package:metro_guid/view/metro_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: const MetroHome(),
    );

      // child: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(
      //         create: (context) => GeolocationBloc(
      //             geolocationRepository: context.read<GeolocationRepository>())
      //           ..add(LoadGeolocation()))
      //   ],

    //   ),
    // );
  }
}
