class dataSheetsFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  dataSheetsFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory dataSheetsFileData.fromJson(Map<String, dynamic> json) {
    return dataSheetsFileData(
      fileNumber: json['file_number5'],
      fileDescription: json['file_description5'],
      subFolderDocuments: json['subfolders_documents5'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class DataSheetsModel {
  String name;
  String id;
  List<dataSheetsFileData> files;

  // Constructor
  DataSheetsModel({required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory DataSheetsModel.fromJson(Map<String, dynamic> json) {
    return DataSheetsModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => dataSheetsFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
