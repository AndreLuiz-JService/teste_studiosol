import 'author_book_model.dart';

class Books {
  String? id;
  String? name;
  String? cover;
  Author? author;
  String? category;
  String? description;
  bool? isFavorite;

  Books({
    this.id,
    this.name,
    this.cover,
    this.author,
    this.category,
    this.description,
    this.isFavorite = false
  });

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    category = json['category'];
    description = json['description'];
    author =
        json['author'] != null ?  Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['category'] = category;
    data['description'] = category;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    return data;
  }
}

