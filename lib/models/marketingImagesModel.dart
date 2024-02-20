class MarketingImagesFileData {
  String fileNumber;
  String fileDescription;
  List<dynamic>
      subFolderDocuments; // Assuming "sub folder documents" is also an array
  String id;
  String date;
  String time;

  // Constructor
  MarketingImagesFileData(
      {required this.fileNumber,
      required this.fileDescription,
      required this.subFolderDocuments,
      required this.id,
      required this.date,
      required this.time});

  // Factory constructor to create FileData objects from JSON
  factory MarketingImagesFileData.fromJson(Map<String, dynamic> json) {
    return MarketingImagesFileData(
      fileNumber: json['file_number10'],
      fileDescription: json['file_description10'],
      subFolderDocuments: json['subfolders_documents10'] ?? [],
      id: json['id'],
      date: json['date'], // Parse date from string
      time: json['time'],
    );
  }
}

class MarketingImagesModel {
  String name;
  String id;
  List<MarketingImagesFileData> files;

  // Constructor
  MarketingImagesModel(
      {required this.name, required this.id, required this.files});

  // Factory constructor to create MainData objects from JSON
  factory MarketingImagesModel.fromJson(Map<String, dynamic> json) {
    return MarketingImagesModel(
      name: json['name'],
      id: json['id'],
      files: (json['files'] as List<dynamic>)
          .map((fileJson) => MarketingImagesFileData.fromJson(fileJson))
          .toList(), // Map file JSON to FileData objects
    );
  }
}
