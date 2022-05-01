// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:metro_guid/bloc/geolocation/geolocation_bloc.dart';
// import 'package:metro_guid/bloc/geolocation/geolocation_state.dart';
// import 'package:metro_guid/location/widget/gmap.dart';
// import 'package:metro_guid/logic/all_lines.dart';
//
// class LocationScreen extends StatelessWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: BlocBuilder<GeolocationBloc, GeolocationState>(
//                 builder: (context, state){
//                   if (state is GeolocationLoaded){
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else if(state is GeolocationLoaded){
//                     return  Gmap(
//                       lat: state.position.latitude,
//                       lng: state.position.longitude,
//                     );
//                   } else {
//                     return const Text('Something went wrong');
//                   }
//                 }
//               ),
//             ),
//           ],
//       ),
//     );
//   }
// }
