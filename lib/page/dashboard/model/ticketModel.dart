class TicketModel {
  String id_ticket;
  String name_ticket;
  DateTime date_start_ticket;
  DateTime date_end_ticket;
  bool isExpired;
  String type;
  String description;
  int stock;
  int current_stock;
  int tiketFee;
  DateTime createdAt;

  TicketModel({
    required this.id_ticket,
    required this.name_ticket,
    required this.date_start_ticket,
    required this.date_end_ticket,
    required this.isExpired,
    required this.type,
    required this.stock,
    required this.description,
    required this.current_stock,
    required this.tiketFee,
    required this.createdAt,
  });
  factory TicketModel.onError() => TicketModel(
      id_ticket: "",
      name_ticket: "",
      date_start_ticket: DateTime.now(),
      date_end_ticket: DateTime.now(),
      isExpired: false,
      type: "",
      stock: 0,
      description: "",
      current_stock: 0,
      tiketFee: 0,
      createdAt: DateTime.now());
}
