import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'line_1_repo.dart';
import 'line_3_repo.dart';
import 'metro_lines.dart';

class StationsLine2Repo {
  static Line line2 = Line(
      2, [
    Stations(
        36, const LatLng(29.98157764595045, 31.21236761534283), "El-Mounib",transition.noTransition),
    Stations(37, const LatLng(29.995670327202305, 31.208623815926938,),
        "Sakiat Mekky",transition.noTransition),
    Stations(38, const LatLng(30.005858281815897, 31.20816311777667),
        "Omm El-Masryeen",transition.noTransition),
    Stations(
        39, const LatLng(30.010680139659943, 31.20727262436966), "El Giza",transition.noTransition),
    Stations(40, const LatLng(30.017257556258745, 31.20375356610484), "Faisal",transition.noTransition),
    Stations(41, const LatLng(30.025973442800126, 31.201097720618147),
        "Cairo University",transition.noTransition),
    Stations(
        42, const LatLng(30.03579144205223, 31.20013212536856), "El Bohoth",transition.noTransition),
    Stations(43, const LatLng(30.03855526381378, 31.212237783473125), "Dokki",transition.noTransition),
    Stations(44, const LatLng(30.041983256500863, 31.224946535950455), "Opera",transition.noTransition),
    Stations(45, const LatLng(30.044204155869032, 31.23443569891304), "Sadat",transition.firstToSecond),
    Stations(46, const LatLng(30.045360220754606, 31.244197235853093),
        "Mohamed Naguib",transition.noTransition),
    Stations(47, const LatLng(30.05232674717125, 31.24679796940866), "Attaba",transition.secondToThird),
    Stations(48, const LatLng(30.061110260498065, 31.246033564629567),
        "Al-Shohadaa",transition.firstToSecond),
    Stations(49, const LatLng(30.07085020223823, 31.245171470664403), "Masserra",transition.noTransition),
    Stations(50, const LatLng(30.08069648804761, 31.245435058538668),
        "Road El-Farag",transition.noTransition),
    Stations(51, const LatLng(30.087962970433026, 31.245524069472648),
        "Saint Teresa",transition.noTransition),
    Stations(
        52, const LatLng(30.09735511570416, 31.245534952108464), "Khalafawy",transition.noTransition),
    Stations(53, const LatLng(30.10416595979361, 31.2456579597874), "Mezalat",transition.noTransition),
    Stations(54, const LatLng(30.113682112027725, 31.248618930061692),
        "Koliet El-zrea",transition.noTransition),
    Stations(55, const LatLng(30.12233757908951, 31.244384268216425),
        "Shobra Elkhiema",transition.noTransition),
  ]);


  static getDirectionLine2(String from, String to) {
    int? fromIndex, toIndex;
    for (var item in line2.stations) {
      if (item.name == from) {
        fromIndex = line2.stations.indexOf(item);
      }
      if (item.name == to) {
        toIndex = line2.stations.indexOf(item);
      }
    }
    List<Stations> direction = [];
    if (fromIndex! < toIndex!) {
      direction = line2.stations.sublist(fromIndex + 1, toIndex + 1);
    } else {
      direction = line2.stations.sublist(toIndex, fromIndex).reversed.toList();
    }
    for (var i in direction) {
      print(i.name);
    }
    return direction;
  }

  static getDirection2And3(String from, String to) {
    int? fromIndex, toIndex, fromLine, toLine;
    String? trans;
    List<Stations>? res1, res2, result;

    for (var item in line2.stations) {
      if (item.name == from) {
        fromLine = 2;
      }
      if (item.name == to) {
        toLine = 2;
      }
    }

    for (var item in StationsLine3Repo.line3.stations) {
      if (item.name == from) {
        fromLine = 3;
      }
      if (item.name == to) {
        toLine = 3;
      }
    }

    for (var item in StationsLine1Repo.line1.stations) {
      if (item.name == from) {
        fromLine = 1;
      }
      if (item.name == to) {
        toLine = 1;
      }
    }
    if (fromLine == toLine) {
      if (fromLine == 2) {
        result = getDirectionLine2(from, to);
      }
      else if (fromLine == 3) {
        result = StationsLine3Repo.getDirectionLine3(from, to);
      }
      else {
        result = StationsLine1Repo.getDirectionLine1(from, to);
      }
    }
    else {
      if (fromLine == 2 && toLine == 3) {
        for (var item in line2.stations) {
          if (item.trans == transition.secondToThird) {
            trans = item.name;
            break;
          }
        }
        res1 = getDirectionLine2(from, trans!);
        res2 = StationsLine3Repo.getDirectionLine3(trans, to);
        result = (res1! + res2!);

      }
      else if (fromLine == 3 && toLine == 2) {
        for (var item in StationsLine3Repo.line3.stations) {
          if (item.trans == transition.secondToThird) {
            trans = item.name;
            break;
          }
        }
        res1 =  StationsLine3Repo.getDirectionLine3(from, trans!);
        res2 = getDirectionLine2(trans, to);
        result = (res1! + res2!);

      }
    }
    return result;
  }


}
