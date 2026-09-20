/// One medical abbreviation item loaded from the local JSON catalog.
class Abbreviation {
  const Abbreviation({
    required this.abbreviation,
    required this.english,
    required this.japanese,
    required this.subjects,
    required this.description,
    required this.related,
  });

  final String abbreviation;
  final String english;
  final String japanese;
  final List<String> subjects;
  final String description;
  final List<String> related;

  factory Abbreviation.fromJson(Map<String, dynamic> json) {
    return Abbreviation(
      abbreviation: json['abbreviation'] as String,
      english: json['english'] as String,
      japanese: json['japanese'] as String,
      subjects: _stringList(json['subjects']),
      description: json['description'] as String,
      related: _stringList(json['related']),
    );
  }

  static List<String> _stringList(dynamic value) {
    if (value is! List) return const [];
    return value.map((item) => item as String).toList();
  }
}
