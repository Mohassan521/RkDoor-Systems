class FileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  FileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory FileData.fromJson(Map<String, dynamic> json) {
    return FileData(
      fileNumber: json['file_number'],
      fileDescription: json['file_description'],
      subFolderDocuments: json['subfolders_documents'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class CadDetailsModel {
  String name;
  String id;
  List<FileData> files;

  // Constructor
  CadDetailsModel({required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory CadDetailsModel.fromJson(Map<String, dynamic> json) {
    return CadDetailsModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => FileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
