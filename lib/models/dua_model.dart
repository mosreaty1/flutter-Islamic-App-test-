class DuaModel {
  final String id;
  final String title;
  final String arabicText;
  final String transliteration;
  final String translation;
  final String category;
  final String reference;

  DuaModel({
    required this.id,
    required this.title,
    required this.arabicText,
    required this.transliteration,
    required this.translation,
    required this.category,
    required this.reference,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      arabicText: json['arabicText'] ?? '',
      transliteration: json['transliteration'] ?? '',
      translation: json['translation'] ?? '',
      category: json['category'] ?? '',
      reference: json['reference'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'arabicText': arabicText,
      'transliteration': transliteration,
      'translation': translation,
      'category': category,
      'reference': reference,
    };
  }
}
