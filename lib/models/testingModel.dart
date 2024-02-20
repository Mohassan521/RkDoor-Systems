class testingFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  testingFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory testingFileData.fromJson(Map<String, dynamic> json) {
    return testingFileData(
      fileNumber: json['file_number6'],
      fileDescription: json['file_description6'],
      subFolderDocuments: json['subfolders_documents6'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class TestingModel {
  String name;
  String id;
  List<testingFileData> files;

  // Constructor
  TestingModel({required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory TestingModel.fromJson(Map<String, dynamic> json) {
    return TestingModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => testingFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
