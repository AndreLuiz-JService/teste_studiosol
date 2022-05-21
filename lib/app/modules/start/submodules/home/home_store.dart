import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/model/category_book_model.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/model/favorite_authors_model.dart';

import 'model/books_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store implements Disposable {
  @observable
  Observable<List<Books>> favoritesBook = Observable([]);

  @action
  void updateFavoriteBook(List? list) {
    if (list != null) {
      List<Books> auxiliarList = [];
      for (var book in list) {
        auxiliarList.add(Books.fromJson(book));
      }
      favoritesBook.value = auxiliarList;
    }
  }

  @observable
  Observable<List<FavoriteAuthors>> favoritesAuthors = Observable([]);

  @action
  void updateFavoriteAuthors(List? list) {
    if (list != null) {
      List<FavoriteAuthors> auxiliarList = [];
      for (var author in list) {
        auxiliarList.add(FavoriteAuthors.fromJson(author));
      }
      favoritesAuthors.value = auxiliarList;
    }
  }

  @observable
  Observable<List<Books>> allBooks = Observable([]);

  @action
  void updateAllBooks(List? list) {
    if (list != null) {
      List<Books> auxiliarList = [];
      for (var book in list) {
        auxiliarList.add(Books.fromJson(book));
      }
      allBooks.value = auxiliarList;
    }
  }

  @observable
  Observable<int> index = 0.asObservable();

  @action
  void toggleIndex(int value) {
    index.value = value;
  }

  PageController pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }

  List<CategoryBook> categorys = [
     CategoryBook(category: 'All', title: 'Todos',isSelect: true),
    CategoryBook(category: 'ROMANCE', title: 'Romance'),
    CategoryBook(category: 'ADVENTURE', title: 'Aventura'),
    CategoryBook(category: 'COMEDY', title: 'Comedia'),
    CategoryBook(category: 'TRAVEL', title: 'Viagem'),
    CategoryBook(category: 'TECHNOLOGY', title: 'Tecnologia'),
    CategoryBook(category: 'HORROR', title: 'Terror'),
  ];

  String queryfavoritesBook = """
  query favoritesBook {
    favoriteBooks {
     id
     name
     cover
      author {
       id
       name
     }
   }
  }
""";

  String queryfavoritesAuthors = """
  query favoriteAuthors {
  favoriteAuthors {
    name
    booksCount
    picture
  }
}
""";

  String queryAllBooks = """
  query allBooks {
  allBooks {
    id
    name
    cover
    author {
      name
    }
  }
}
""";

  String userPicture = """
  query userPicture {
  userPicture
}
""";
}
