import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:teste_studiosol/app/core/app_theme/app_color.dart';
import 'package:teste_studiosol/app/core/app_theme/app_text_styles.dart';
import 'package:teste_studiosol/app/modules/start/submodules/home/home_store.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key,required this.size,required this.store}) : super(key: key);
  final Size size;
  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Container(
      height: 128,
      width: size.width,
      padding: const EdgeInsets.fromLTRB(20, 6, 12, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(32)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1))]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'SS',
                    style: AppTextStyles.titleHomeGrey,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'BOOK', style: AppTextStyles.titleHomePUrple),
                    ],
                  ),
                ),
                Query(
                    options: QueryOptions(
                      document: gql(store.userPicture),
                    ),
                    builder: (QueryResult result,
                        {VoidCallback? refetch, FetchMore? fetchMore}) {
                      if (result.hasException) {
                        return Text(result.exception.toString());
                      }

                      if (result.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final String? url = result.data?['userPicture'];
                      if (url == null) {
                        return const Center(
                          child: Text('repositorio vazio'),
                        );
                      }

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 22),
              width: size.width * 0.6,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() {
                        store.toggleIndex(0);
                        store.pageViewController.jumpToPage(0);
                      }),
                      child: SizedBox(
                          width: size.width * 0.3,
                          child: Column(children: [
                            Text(
                              'Meus Livros',
                              style: AppTextStyles.textGrey14,
                            ),
                            Observer(builder: (_) {
                              return Container(
                                height: 4,
                                margin: const EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                    color: store.index.value == 0
                                        ? AppColors.purple
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2))),
                              );
                            })
                          ])),
                    ),
                    InkWell(
                      onTap: (() {
                        store.toggleIndex(1);
                        store.pageViewController.jumpToPage(1);
                      }),
                      child: SizedBox(
                          width: size.width * 0.3,
                          child: Column(children: [
                            Text(
                              'Emprestados',
                              style: AppTextStyles.textGrey14,
                            ),
                            Observer(builder: (_) {
                              return Container(
                                height: 4,
                                margin: const EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                    color: store.index.value == 1
                                        ? AppColors.purple
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        topRight: Radius.circular(2))),
                              );
                            })
                          ])),
                    ),
                  ]),
            )
          ]),
    );
  }
}
