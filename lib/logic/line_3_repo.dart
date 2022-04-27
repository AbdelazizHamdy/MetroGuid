import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'metro_lines.dart';

class StationsLine3Repo {
  static Line line3 = Line(
      3, [
    Stations(56, const LatLng(30.101364, 31.332987), "AirPort",transition.noTransition),
    Stations(57, const LatLng(30.101364, 31.332987), "Ahmed Galal",transition.noTransition),
    Stations(58, const LatLng(30.101364, 31.332987), "Adly Mansour",transition.noTransition),
    Stations(59, const LatLng(30.101364, 31.332987), "El-HaykStep",transition.noTransition),
    Stations(60, const LatLng(30.101364, 31.332987), "Omar Ebn ElKhatab",transition.noTransition),
    Stations(61, const LatLng(30.101364, 31.332987), "Qobaa",transition.noTransition),
    Stations(62, const LatLng(30.101364, 31.332987), "Hisham Barakat",transition.noTransition),
    Stations(63, const LatLng(30.101364, 31.332987), "El-Nozha",transition.noTransition),
    Stations(64, const LatLng(30.101364, 31.332987), "Nadi El-shams",transition.noTransition),
    Stations(65, const LatLng(30.101364, 31.332987), "Alf Maskan",transition.noTransition),
    Stations(66, const LatLng(30.101364, 31.332987), "Medan Helioples",transition.noTransition),
    Stations(67, const LatLng(30.101364, 31.332987), "Haroun Elrashid",transition.noTransition),
    Stations(68, const LatLng(30.091727, 31.326348), "Al Ahram",transition.noTransition),
    Stations(69, const LatLng(30.084231, 31.328987), "Kolleyt Elbanat",transition.noTransition),
    Stations(70, const LatLng(30.073146, 31.318028), "Cairo Stadium",transition.noTransition),
    Stations(71, const LatLng(30.074045668577558, 31.30096025854728),
        "Cairo Fairgrounds",transition.noTransition),
    Stations(
        72, const LatLng(30.07185450136357, 31.283407882732888), "Abbasiya",transition.noTransition),
    Stations(
        73, const LatLng(30.064872153265167, 31.274696067881834), "Abdo Pasha",transition.noTransition),
    Stations(
        74, const LatLng(30.061946031960805, 31.2668153682272), "El Geish",transition.noTransition),
    Stations(75, const LatLng(30.054249125866836, 31.25581331646725),
        "Bab elshareya",transition.noTransition),
    Stations(
        76, const LatLng(30.052268121864987, 31.246709292916158), "Attaba",transition.secondToThird),
    Stations(77, const LatLng(30.052268121864987, 31.246709292916158),
        "Gamal Abdelnaser",transition.firstToThird),
    Stations(78, const LatLng(0.0, 0.0), "Embaba",transition.noTransition),
    Stations(79, const LatLng(0.0, 0.0), "Boulaq ElDakrour",transition.noTransition),
    Stations(80, const LatLng(0.0, 0.0), "Cairo University",transition.noTransition),
  ]);

  static getDirectionLine3(String from, String to) {
    int? fromIndex, toIndex;
    for (var item in line3.stations) {
      if (item.name == from) {
        fromIndex = line3.stations.indexOf(item);
      }
      if (item.name == to) {
        toIndex = line3.stations.indexOf(item);
      }
    }
    List<Stations> direction = [];
    if (fromIndex! < toIndex!) {
      direction = line3.stations.sublist(fromIndex + 1, toIndex + 1);
    } else {
      direction = line3.stations.sublist(toIndex, fromIndex).reversed.toList();
    }
    for (var i in direction) {
      print(i.name);
    }
    return direction;
  }

}