import 'package:hive/hive.dart';

import '../entities/book_entity.dart';



Future<void> saveData({
  required List<BookEntity> books,
  required String boxName,
}) async {
  var box = Hive.box<BookEntity>(boxName);

  final existingTitles = box.values
      .map((book) => book.title)
      .whereType<String>()
      .toSet();

  final newBooks = books.where((book) {
    final title = book.title;
    return title != null && !existingTitles.contains(title);
  });
  await box.addAll(newBooks);
}
