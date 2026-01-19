class HadithModel {
  final String id;
  final String title;
  final String arabicText;
  final String translation;
  final String narrator;
  final String book;
  final String reference;

  HadithModel({
    required this.id,
    required this.title,
    required this.arabicText,
    required this.translation,
    required this.narrator,
    required this.book,
    required this.reference,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      arabicText: json['arabicText'] ?? '',
      translation: json['translation'] ?? '',
      narrator: json['narrator'] ?? '',
      book: json['book'] ?? '',
      reference: json['reference'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'arabicText': arabicText,
      'translation': translation,
      'narrator': narrator,
      'book': book,
      'reference': reference,
    };
  }
}
