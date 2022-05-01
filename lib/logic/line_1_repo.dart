import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'line_2_repo.dart';
import 'line_3_repo.dart';
import 'metro_lines.dart';

class StationsLine1Repo {
  static Line line1 = Line(
    1,
    [
      Stations(1, const LatLng(29.8549513421837, 31.32343015677391), "Helwan", transition.noTransition),
      Stations(2, const LatLng(29.869206171830808, 31.325160395022664), "Ein Helwan", transition.noTransition),
      Stations(3, const LatLng(29.869144710638277, 31.32007677400911), "Gamaaet Helwan", transition.noTransition),
      Stations(4, const LatLng(29.879333526855255, 31.313413832811207), "Wadi Hof", transition.noTransition),
      Stations(5, const LatLng(29.89769483389593, 31.303994904129055), "Hadayek Helwan", transition.noTransition),
      Stations(6, const LatLng(29.906135922900997, 31.29934899872624), "Elma3sra", transition.noTransition),
      Stations(7, const LatLng(29.926053756832363, 31.28745360937317), "Tora Elasmant", transition.noTransition),
      Stations(8, const LatLng(29.936775463523826, 31.28180691910918), "Kotska", transition.noTransition),
      Stations(9, const LatLng(29.94678216663228, 31.27278847540248), "Tora el balad", transition.noTransition),
      Stations(10, const LatLng(29.9533563889763, 31.263079119976044), "thakanat el maadi", transition.noTransition),
      Stations(11, const LatLng(29.960440421446908, 31.257567522038396), "ElMaadi", transition.noTransition),
      Stations(12, const LatLng(29.970161160873825, 31.250375287365472), "Hadayek ElMaadi", transition.noTransition),
      Stations(13, const LatLng(29.982087568312885, 31.24214467616864), "Dar el Salam", transition.noTransition),
      Stations(14, const LatLng(29.995507770110997, 31.231174136520483), "Elzahraa", transition.noTransition),
      Stations(15, const LatLng(30.006106069542284, 31.22954364310729), "Mar Girgis", transition.noTransition),
      Stations(16, const LatLng(30.01772116788694, 31.23122140069235), "ElMalek Elsaleh", transition.noTransition),
      Stations(17, const LatLng(30.029277482496692, 31.235421653264485), "Alsayeda Zainab", transition.noTransition),
      Stations(18, const LatLng(30.037025038100968, 31.23823391053657), "Saad Zaghloul", transition.noTransition),
      Stations(19, const LatLng(30.04415384175817, 31.234360205670402), "Sadat", transition.firstToSecond),
      Stations(20, const LatLng(30.053421679502307, 31.238690201235844), "Gamal Abdelnaser", transition.firstToThird),
      Stations(21, const LatLng(30.05670286410241, 31.242025078178813), "Orabi", transition.noTransition),
      Stations(22, const LatLng(30.061099942475533, 31.246086491712262), "Al-Shohadaa", transition.firstToSecond),
      Stations(23, const LatLng(30.06900922732733, 31.26462181605267), "Ghamra", transition.noTransition),
      Stations(24, const LatLng(30.077318327733913, 31.277826853929387), "Eldemerdash", transition.noTransition),
      Stations(25, const LatLng(30.08199948563704, 31.28752347171895), "Manshiet Elsadr", transition.noTransition),
      Stations(26, const LatLng(30.08719462687739, 31.29409450254391), "Kobri El-Qoba", transition.noTransition),
      Stations(27, const LatLng(30.091207103143354, 31.298928852751505), "Hamammat ElQoba", transition.noTransition),
      Stations(28, const LatLng(30.097632529241586, 31.304505264447346), "Saray ElQoba", transition.noTransition),
      Stations(29, const LatLng(30.10591573294739, 31.31044814527447), "Hadayeq El-Zaitoun", transition.noTransition),
      Stations(30, const LatLng(30.113234092312137, 31.313944600398017), "Helmet El-Zaitoun", transition.noTransition),
      Stations(31, const LatLng(30.12132131510205, 31.31373169707319), "El-Matareyya", transition.noTransition),
      Stations(32, const LatLng(30.131059009133534, 31.319002509584763), "Ain Shams", transition.noTransition),
      Stations(33, const LatLng(30.139318420051797, 31.32436045246425), "Ezbet El-Nakhl", transition.noTransition),
      Stations(34, const LatLng(30.15210839309091, 31.335699625908983), "El-Marg", transition.noTransition),
      Stations(35, const LatLng(30.163622775027925, 31.338320874766325), "New El-Marg", transition.noTransition),
    ],
  );


  static getDirectionLine1(String from, String to) {
    int? fromIndex, toIndex;
    for (var item in line1.stations) {
      if (item.name == from) {
        fromIndex = line1.stations.indexOf(item);
      }
      if (item.name == to) {
        toIndex = line1.stations.indexOf(item);
      }
    }
    List<Stations> direction = [];
    if (fromIndex! < toIndex!) {
      direction = line1.stations.sublist(fromIndex + 1, toIndex + 1);
    } else {
      direction = line1.stations.sublist(toIndex, fromIndex).reversed.toList();
    }
    for (var i in direction) {
      print(i.name);
    }
    return direction;
  }

  // to get directions from line1 to line 2 and rev
  static getDirection1And2(String from, String to) {
    int? fromIndex, toIndex, fromLine, toLine;
    String? trans;
    List<Stations>? res1, res2, result;

    for (var item in line1.stations) {
      if (item.name == from) {
        fromLine = 1;
      }
      if (item.name == to) {
        toLine = 1;
      }
    }

    for (var item in StationsLine2Repo.line2.stations) {
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
    if (fromLine == toLine) {
      if (fromLine == 1) {
        result = getDirectionLine1(from, to);
      }
      else if (fromLine == 2) {
        result = StationsLine2Repo.getDirectionLine2(from, to);
      }
      else {
        result = StationsLine3Repo.getDirectionLine3(from, to);
      }
    }
    else {
      if (fromLine == 1 && toLine == 2) {
        for (var item in line1.stations) {
          if (item.trans == transition.firstToSecond) {
            trans = item.name;
            break;
          }
        }
        res1 = getDirectionLine1(from, trans!);
        res2 = StationsLine2Repo.getDirectionLine2(trans, to);
        result = (res1! + res2!);
      }
      else if (fromLine == 2 && toLine == 1) {
        for (var item in StationsLine2Repo.line2.stations) {
          if (item.trans == transition.firstToSecond) {
            trans = item.name;
            break;
          }
        }
        res1 = StationsLine2Repo.getDirectionLine2(from, trans!);
        res2 = getDirectionLine1(trans, to);
        result = (res1! + res2!);
      }
    }
    return result;
  }

  // to get directions from line1 to line 3 and rev

  static getDirection1And3(String from, String to) {
    int? fromIndex, toIndex, fromLine, toLine;
    String? trans;
    List<Stations>? res1, res2, result;

    for (var item in line1.stations) {
      if (item.name == from) {
        fromLine = 1;
      }
      if (item.name == to) {
        toLine = 1;
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

    for (var item in StationsLine2Repo.line2.stations) {
      if (item.name == from) {
        fromLine = 2;
      }
      if (item.name == to) {
        toLine = 2;
      }
    }
    if (fromLine == toLine) {
      if (fromLine == 1) {
        result = getDirectionLine1(from, to);
      }
      else if (fromLine == 3) {
        result = StationsLine3Repo.getDirectionLine3(from, to);
      }
      else {
        result = StationsLine2Repo.getDirectionLine2(from, to);
      }
    }
    else {
      if (fromLine == 1 && toLine == 3) {
        for (var item in line1.stations) {
          if (item.trans == transition.firstToThird) {
            trans = item.name;
            break;
          }
        }
        res1 = getDirectionLine1(from, trans!);
        res2 = StationsLine3Repo.getDirectionLine3(trans, to);
        result = (res1! + res2!);
      }
      else if (fromLine == 3 && toLine == 1) {
        for (var item in StationsLine3Repo.line3.stations) {
          if (item.trans == transition.firstToThird) {
            trans = item.name;
            break;
          }
        }
        res1 = StationsLine3Repo.getDirectionLine3(from, trans!);
        res2 = getDirectionLine1(trans, to);
        result = (res1! + res2!);
      }
    }
    return result;
  }


  // to get directions of any station

  static getDirectionsAllLines(String from, String to) {
    int? fromLine, toLine;

    List<Stations>? res1, res2, result;

    for (var item in line1.stations) {
      if (item.name == from) {
        fromLine = 1;
      }
      if (item.name == to) {
        toLine = 1;
      }
    }
    for (var item in StationsLine2Repo.line2.stations) {
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

    if (fromLine == toLine) {
      if (fromLine == 1) {
        result = getDirectionLine1(from, to);
      }
      else if (fromLine == 2) {
        result = StationsLine2Repo.getDirectionLine2(from, to);
      }
      else {
        result = StationsLine3Repo.getDirectionLine3(from, to);
      }
    }
    else {
      if (fromLine == 1 && toLine == 2 || fromLine == 2 && toLine == 1) {
        result = getDirection1And2(from, to);
      } else if (fromLine == 1 && toLine == 3 || fromLine == 3 && toLine == 1) {
        result = getDirection1And3(from, to);
      } else if (fromLine == 2 && toLine == 3 || fromLine == 3 && toLine == 2) {
        result = StationsLine2Repo.getDirection2And3(from, to);
      }
    }
    return result;

  }
}