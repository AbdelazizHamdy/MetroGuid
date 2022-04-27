import 'package:google_maps_flutter/google_maps_flutter.dart';

//url lanser maps
enum transition {
  noTransition,
  firstToSecond,
  firstToThird,
  secondToThird,

}
class Stations {
  final String? name;
  final int? index;
  final LatLng? location;
  final transition trans;
  // List<int> linesIndex;

  // Map<String, int>? transition;

/*
Helwan
1
0.1,0.2
[1]

Sadat


[1,2]
{'from':1,'to':2}
*/
  Stations(this.index, this.location, this.name, this.trans);
}

class Line {
  int? number;

  List<Stations> stations;

  Line(this.number, this.stations);

//   List<Stations> getTransitionStation(int fromLine, int toLine) {
//     List<Stations> stations = [];
//     for (var station in stations) {
//       if (station.linesIndex.length == 2) {
//         if (station.linesIndex.contains(fromLine) &&
//             station.linesIndex.contains(toLine)) {
//           stations.add(station);
//         }
//       }
//     }
//     return stations;
//   }
}

class AllLines {
  List<Line>? allLines;

  AllLines(this.allLines);
}

// List<Stations> getLine3Stations = <Stations>
