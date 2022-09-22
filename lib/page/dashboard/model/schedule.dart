import 'package:coscos/page/dashboard/model/runDown.dart';

class ScheduleModel {
  String id;
  DateTime dateEvent;
  String? PIC;
  String? location;
  List<RunDownModel> runDown;
  ScheduleModel(
      {required this.id,
      required this.dateEvent,
       this.PIC ="",
       this.location = "",
      required this.runDown
      });
}
