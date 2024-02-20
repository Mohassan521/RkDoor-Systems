class careFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  careFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory careFileData.fromJson(Map<String, dynamic> json) {
    return careFileData(
      fileNumber: json['file_number3'],
      fileDescription: json['file_description3'],
      subFolderDocuments: json['subfolders_documents3'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class CareAndMaintenanceModel {
  String name;
  String id;
  List<careFileData> files;

  // Constructor
  CareAndMaintenanceModel(
      {required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory CareAndMaintenanceModel.fromJson(Map<String, dynamic> json) {
    return CareAndMaintenanceModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => careFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
