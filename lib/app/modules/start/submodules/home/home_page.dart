import 'dart:developer';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:teste_studiosol/app/core/app_theme/app_color.dart';
import 'package:teste_studiosol/app/core/app_theme/app_text_styles.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/model/favorite_authors_model.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/pages/book_select_page.dart';

import 'components/app_bar/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    store.pageViewController = PageController();
    store.index.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBar(size: size, store: store),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: PageView(
              controller: store.pageViewController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: Container(
                        width: size.width,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Livros Favoritos',
                              style: AppTextStyles.sectionTitle,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Ver Todos',
                                style: AppTextStyles.verTodos,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 304,
                      child: Query(
                          options: QueryOptions(
                            document: gql(store.queryfavoritesBook),
                          ),
                          builder: (QueryResult result,
                              {VoidCallback? refetch, FetchMore? fetchMore}) {
                            if (result.hasException) {
                              return Text(result.exception.toString());
                            }

                            if (result.isLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            store.updateFavoriteBook(
                                result.data?['favoriteBooks']);

                            return Observer(builder: (_) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final favoriteBook =
                                      store.favoritesBook.value[index];
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 32),
                                    child: InkWell(
                                      onTap: (() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   BookSelectPage(book: favoriteBook),),
                                        );
                                      }),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: SizedBox(
                                                width: 136,
                                                height: 198,
                                                child: Image.network(
                                                  favoriteBook.cover!,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 136,
                                            child: Text(
                                              favoriteBook.name!,
                                              style: AppTextStyles
                                                  .favoriteBookName,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 136,
                                            child: Text(
                                              favoriteBook.author!.name!,
                                              style: AppTextStyles
                                                  .favoriteBookauthor,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: store.favoritesBook.value.length,
                              );
                            });
                          }),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Autores Favoritos',
                                  style: AppTextStyles.sectionTitle,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Ver Todos',
                                    style: AppTextStyles.verTodos,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Query(
                              options: QueryOptions(
                                document: gql(store.queryfavoritesAuthors),
                              ),
                              builder: (QueryResult result,
                                  {VoidCallback? refetch,
                                  FetchMore? fetchMore}) {
                                if (result.hasException) {
                                  return Text(result.exception.toString());
                                }
                                if (result.isLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                store.updateFavoriteAuthors(
                                    result.data?['favoriteAuthors']);

                                return SizedBox(
                                  height: 119,
                                  child: Observer(builder: (_) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final favoriteAuthors =
                                            store.favoritesAuthors.value[index];
                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 32),
                                            child: Container(
                                              width: 248,
                                              height: 67,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .borderGrey)),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: SizedBox(
                                                        width: 63,
                                                        height: 67,
                                                        child: Image.network(
                                                          favoriteAuthors
                                                              .picture!,
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                            favoriteAuthors
                                                                .name!,
                                                            style: AppTextStyles
                                                                .favoriteBookName,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '${favoriteAuthors.booksCount.toString()} livros',
                                                            style: AppTextStyles
                                                                .favoriteBookauthor,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          store.favoritesAuthors.value.length,
                                    );
                                  }),
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Biblioteca',
                                style: AppTextStyles.sectionTitle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: SizedBox(
                              height: 32,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final category = store.categorys[index];
                                  final bool isLastIndex =
                                      index == store.categorys.length - 1;
                                  final double left = index == 0 ? 20 : 5;
                                  final double right = isLastIndex ? 20 : 5;
                                  return Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(left, 0, right, 0),
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: category.isSelect
                                              ? AppColors.purple
                                              : Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              side: BorderSide(
                                                color: category.isSelect
                                                    ? AppColors.borderGrey
                                                    : Colors.transparent,
                                              )),
                                        ),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 6, 16, 6),
                                          child: Text(
                                            category.title!,
                                            style: category.isSelect
                                                ? AppTextStyles.textWhite14
                                                : AppTextStyles.textGrey14,
                                          ),
                                        )),
                                  );
                                },
                                itemCount: store.categorys.length,
                              ),
                            ),
                          ),
                          Query(
                              options: QueryOptions(
                                document: gql(store.queryAllBooks),
                              ),
                              builder: (QueryResult result,
                                  {VoidCallback? refetch,
                                  FetchMore? fetchMore}) {
                                if (result.hasException) {
                                  return Text(result.exception.toString());
                                }
                                if (result.isLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                store.updateAllBooks(result.data?['allBooks']);

                                return Observer(builder: (_) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final allBooks =
                                          store.allBooks.value[index];
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 20),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: SizedBox(
                                                    width: 48,
                                                    height: 70,
                                                    child: Image.network(
                                                      allBooks.cover!,
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            child: Text(
                                                          allBooks.name!,
                                                          style: AppTextStyles
                                                              .favoriteBookName,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                            child: Text(
                                                          allBooks
                                                              .author!.name!,
                                                          style: AppTextStyles
                                                              .favoriteBookauthor,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: store.allBooks.value.length,
                                  );
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                Container()
              ],
            ),
          ),
        ],
      )),
    );
  }
}
