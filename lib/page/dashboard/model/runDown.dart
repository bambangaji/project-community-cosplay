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