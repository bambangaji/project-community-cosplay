// ignore_for_file: file_names, non_constant_identifier_names

class RunDownModel {
  String id;
  String startTime;
  String endTime;
  String content;
  String? PIC;
  String? location;
  
  RunDownModel({
  required this.id,
  required this.startTime,
  required this.endTime,
  required this.content,
  this.PIC ="",
  this.location =""
  });
}