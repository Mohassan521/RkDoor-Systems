class PDFFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  PDFFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory PDFFileData.fromJson(Map<String, dynamic> json) {
    return PDFFileData(
      fileNumber: json['file_number2'],
      fileDescription: json['file_description2'],
      subFolderDocuments: json['subfolders_documents2'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class PDFDetailsModel {
  String name;
  String id;
  List<PDFFileData> files;

  // Constructor
  PDFDetailsModel({required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory PDFDetailsModel.fromJson(Map<String, dynamic> json) {
    return PDFDetailsModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => PDFFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
