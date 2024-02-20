class BIMFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  BIMFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory BIMFileData.fromJson(Map<String, dynamic> json) {
    return BIMFileData(
      fileNumber: json['file_number9'],
      fileDescription: json['file_description9'],
      subFolderDocuments: json['subfolders_documents9'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class BIMDetailsModel {
  String name;
  String id;
  List<BIMFileData> files;

  // Constructor
  BIMDetailsModel({required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory BIMDetailsModel.fromJson(Map<String, dynamic> json) {
    return BIMDetailsModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => BIMFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
