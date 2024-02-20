class instructionsFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  instructionsFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory instructionsFileData.fromJson(Map<String, dynamic> json) {
    return instructionsFileData(
      fileNumber: json['file_number4'],
      fileDescription: json['file_description4'],
      subFolderDocuments: json['subfolders_documents4'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class InstructionsModel {
  String name;
  String id;
  List<instructionsFileData> files;

  // Constructor
  InstructionsModel(
      {required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory InstructionsModel.fromJson(Map<String, dynamic> json) {
    return InstructionsModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => instructionsFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
