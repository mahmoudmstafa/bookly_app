
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? auth;
  @HiveField(2)
  final int? image;


  BookEntity({
    this.title,
    this.auth,
    this.image,
  });
  String get coverImageUrl {
    if (image != null) {
      return 'https://covers.openlibrary.org/b/id/$image-L.jpg';
    }
    return '';
  }
}