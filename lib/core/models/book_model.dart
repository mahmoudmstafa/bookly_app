class BookModel {
  final String? title;
  final String? auth;
  final String? image;

  BookModel({
    this.title,
    this.auth,
    this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final coverId = json['cover_i'];

    return BookModel(
      title: json['title'] ?? 'No title',
      auth: (json['author_name'] as List?)?.join(', ') ?? 'No author',
      image: coverId != null
          ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
          : null,
    );
  }
}