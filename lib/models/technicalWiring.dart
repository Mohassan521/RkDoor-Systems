class TechnicalWiringFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  TechnicalWiringFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory TechnicalWiringFileData.fromJson(Map<String, dynamic> json) {
    return TechnicalWiringFileData(
      fileNumber: json['file_number7'],
      fileDescription: json['file_description7'],
      subFolderDocuments: json['subfolders_documents7'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class TechnicalAndWiringModel {
  String name;
  String id;
  List<TechnicalWiringFileData> files;

  // Constructor
  TechnicalAndWiringModel(
      {required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory TechnicalAndWiringModel.fromJson(Map<String, dynamic> json) {
    return TechnicalAndWiringModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => TechnicalWiringFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
