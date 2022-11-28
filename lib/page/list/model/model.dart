class FilterModel {
  static List AllStatusDocument = [
    "PREPARE",
    "WAITING_SIGNING",
    "SIGNING_OTP_OK",
    "WAITING_SIGNED",
    "SIGNED",
    "SIGNED_PARTIAL",
    "SIGNING_EXPIRED",
    "CANCELED",
    "FAIL",
    "SIGNING_COMPLETED",
    "SUBMITTED",
    "SIGNING_PARTIAL"
  ];
  static List StatusTaskDocument = [
    "PENDING",
    "READY_TO_COMPLETED",
    "CANCELED",
    "COMPLETED"
  ];
//   static List StatusStampingDocument = [
//   "PREPARING",
//   "DOCUMENT_SUBMITTED",
//   "SN_GENERATED",
// "STAMPING_ON_PROGRESS",
// "STAMPING_SUCCESS",
// "STAMPING_ERROR"
//   ];
  static List StatusStampingDocument = ["PREPARING", "PROCESSING", "DONE"];
  static List OrderDocument = ["STAMPING", "SIGNING"];
  static List TypeSerial = ["ANIME", "GAME", "MOVIE", "OTHER"];
  static List TypeStampingDocument = ["SINGLE", "BULK"];
}
