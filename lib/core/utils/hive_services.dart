


import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/book_entity.dart';
import 'constant.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(BookEntityAdapter());

    await Hive.openBox<BookEntity>(generalBox);
    await Hive.openBox<BookEntity>(latestBooks);
    await Hive.openBox<BookEntity>(youCanAlsoLike);
    await Hive.openBox<BookEntity>(resultsBook);
  }

  static Future<void> clearBoxes() async {
    await Hive.box<BookEntity>(generalBox).clear();
  }
}