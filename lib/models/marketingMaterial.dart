class MarketingMaterialFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  MarketingMaterialFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory MarketingMaterialFileData.fromJson(Map<String, dynamic> json) {
    return MarketingMaterialFileData(
      fileNumber: json['file_number8'],
      fileDescription: json['file_description8'],
      subFolderDocuments: json['subfolders_documents8'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class MarketingMaterialModel {
  String name;
  String id;
  List<MarketingMaterialFileData> files;

  // Constructor
  MarketingMaterialModel(
      {required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory MarketingMaterialModel.fromJson(Map<String, dynamic> json) {
    return MarketingMaterialModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => MarketingMaterialFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
