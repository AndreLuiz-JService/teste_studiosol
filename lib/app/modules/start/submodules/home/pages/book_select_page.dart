import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:teste_studiosol/app/core/app_theme/app_text_styles.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/home_store.dart';

import '../model/books_model.dart';

class BookSelectPage extends StatelessWidget {
  const BookSelectPage({Key? key, required this.book, required this.store})
      : super(key: key);
  final Books book;
  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Stack(
        children: [
          Image.network(book.cover!,
              width: size.width, height: size.height, fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.black38, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.black26, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30,
                          )))
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.35),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            book.name!,
                            style: AppTextStyles.sectionTitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border_outlined)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                      child: Text(
                        book.author!.name!,
                        style: AppTextStyles.favoriteBookauthor,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Query(
                              options: QueryOptions(
                                document: gql(store.queryDescription),
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

                                store.updateDescription(
                                    result.data?['allBooks'], book.id!);

                                return Text(store.description);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
