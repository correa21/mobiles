import 'package:hive/hive.dart';

//part 'models/data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;

  DataModel(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.publishedAt,
      this.url,
      this.urlToImage});
}
