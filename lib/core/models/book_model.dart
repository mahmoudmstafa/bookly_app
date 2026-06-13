




import '../entities/book_entity.dart';

class BookModel extends BookEntity {
  final String? title;
  final List<String>? authorNames;
  final List<String>? authorKeys;
  final String? coverEditionKey;
  final int? coverId;
  final String? ebookAccess;
  final int? editionCount;
  final int? firstPublishYear;
  final bool? hasFulltext;
  final List<String>? languages;
  final String? key;

  BookModel({
    this.title,
    this.authorNames,
    this.authorKeys,
    this.coverEditionKey,
    this.coverId,
    this.ebookAccess,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.languages,
    this.key,
  }) : super (
    image: coverId ?? 0,
    auth: authorNames?.first ?? 'Author Un Known',
    title: title,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      authorNames:
      (json['author_name'] as List?)?.map((e) => e.toString()).toList(),
      authorKeys:
      (json['author_key'] as List?)?.map((e) => e.toString()).toList(),
      coverEditionKey: json['cover_edition_key'],
      coverId: json['cover_i'],
      ebookAccess: json['ebook_access'],
      editionCount: json['edition_count'],
      firstPublishYear: json['first_publish_year'],
      hasFulltext: json['has_fulltext'],
      languages:
      (json['language'] as List?)?.map((e) => e.toString()).toList(),
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author_name': authorNames,
      'author_key': authorKeys,
      'cover_edition_key': coverEditionKey,
      'cover_i': coverId,
      'ebook_access': ebookAccess,
      'edition_count': editionCount,
      'first_publish_year': firstPublishYear,
      'has_fulltext': hasFulltext,
      'language': languages,
      'key': key,
    };
  }


}