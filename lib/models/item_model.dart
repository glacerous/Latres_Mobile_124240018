import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double rating;

  @HiveField(4)
  final List<String> genres;

  @HiveField(5)
  final String summary;

  ItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.genres,
    required this.summary,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    final rawSummary = (json['summary'] ?? '') as String;
    return ItemModel(
      id: json['id'] ?? 0,
      title: json['name'] ?? 'No Title',
      image: json['image']?['medium'] ?? json['image']?['original'] ?? '',
      rating: (json['rating']?['average'] as num?)?.toDouble() ?? 0.0,
      genres: List<String>.from(json['genres'] ?? []),
      summary: rawSummary.replaceAll(RegExp(r'<[^>]*>'), ''),
    );
  }
}