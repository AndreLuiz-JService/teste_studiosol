import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  await initHiveForFlutter();
  final HttpLink httpLink = HttpLink(
    'https://us-central1-ss-devops.cloudfunctions.net/GraphQL',
  );
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  var app = GraphQLProvider(client: client, child: AppWidget());

  runApp(ModularApp(module: AppModule(), child: app));
}
