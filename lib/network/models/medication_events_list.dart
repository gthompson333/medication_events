import 'event.dart';

class Events {
  final List<Event> events;

  Library({this.books});

  factory Library.fromRawJson(String str) =>
      Library.fromJson(json.decode(str));

  factory Library.fromJson(Map<String, dynamic> json) => Library(
      books: List<Book>.from(
          json["bookList"].map((x) => Book.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "bookList": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}