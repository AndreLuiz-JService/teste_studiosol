// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$favoritesBookAtom =
      Atom(name: '_HomeStoreBase.favoritesBook', context: context);

  @override
  Observable<List<Books>> get favoritesBook {
    _$favoritesBookAtom.reportRead();
    return super.favoritesBook;
  }

  @override
  set favoritesBook(Observable<List<Books>> value) {
    _$favoritesBookAtom.reportWrite(value, super.favoritesBook, () {
      super.favoritesBook = value;
    });
  }

  late final _$favoritesAuthorsAtom =
      Atom(name: '_HomeStoreBase.favoritesAuthors', context: context);

  @override
  Observable<List<FavoriteAuthors>> get favoritesAuthors {
    _$favoritesAuthorsAtom.reportRead();
    return super.favoritesAuthors;
  }

  @override
  set favoritesAuthors(Observable<List<FavoriteAuthors>> value) {
    _$favoritesAuthorsAtom.reportWrite(value, super.favoritesAuthors, () {
      super.favoritesAuthors = value;
    });
  }

  late final _$allBooksAtom =
      Atom(name: '_HomeStoreBase.allBooks', context: context);

  @override
  Observable<List<Books>> get allBooks {
    _$allBooksAtom.reportRead();
    return super.allBooks;
  }

  @override
  set allBooks(Observable<List<Books>> value) {
    _$allBooksAtom.reportWrite(value, super.allBooks, () {
      super.allBooks = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_HomeStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$indexAtom = Atom(name: '_HomeStoreBase.index', context: context);

  @override
  Observable<int> get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(Observable<int> value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void updateFavoriteBook(List<dynamic>? list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateFavoriteBook');
    try {
      return super.updateFavoriteBook(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFavoriteAuthors(List<dynamic>? list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateFavoriteAuthors');
    try {
      return super.updateFavoriteAuthors(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAllBooks(List<dynamic>? list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateAllBooks');
    try {
      return super.updateAllBooks(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDescription(List<dynamic> list, String id) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.updateDescription');
    try {
      return super.updateDescription(list, id);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIndex(int value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.toggleIndex');
    try {
      return super.toggleIndex(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesBook: ${favoritesBook},
favoritesAuthors: ${favoritesAuthors},
allBooks: ${allBooks},
description: ${description},
index: ${index}
    ''';
  }
}
