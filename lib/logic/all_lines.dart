
import 'line_1_repo.dart';
import 'line_2_repo.dart';
import 'line_3_repo.dart';
import 'metro_lines.dart';

class StationsAllLinesRepo {
  static AllLines allLines = AllLines([
    StationsLine1Repo.line1,
    StationsLine2Repo.line2,
    StationsLine3Repo.line3,
  ]);

}
