class FavoriteAuthors {
  String? name;
  int? booksCount;
  String? picture;

  FavoriteAuthors({this.name, this.booksCount, this.picture});

  FavoriteAuthors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    booksCount = json['booksCount'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['booksCount'] = booksCount;
    data['picture'] = picture;
    return data;
  }
}