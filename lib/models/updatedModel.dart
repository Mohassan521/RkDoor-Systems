class UpdatesModel {
  String? updateMessage;
  String? id;
  String? date;
  String? time;

  UpdatesModel({this.updateMessage, this.id, this.date, this.time});

  factory UpdatesModel.fromJson(Map<String, dynamic> json) {
    return UpdatesModel(
        updateMessage: json['update_message'],
        id: json['id'],
        date: json['date'],
        time: json['time']);
  }
}
