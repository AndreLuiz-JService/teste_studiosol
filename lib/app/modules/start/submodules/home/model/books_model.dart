import 'author_book_model.dart';

class Books {
  String? id;
  String? name;
  String? cover;
  Author? author;
  String? category;
  String? description;

  Books({
    this.id,
    this.name,
    this.cover,
    this.author,
    this.category,
    this.description,
  });

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    category = json['category'];
    description = json['description'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cover'] = this.cover;
    data['category'] = this.category;
    data['description'] = this.category;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

