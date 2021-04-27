import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QLConfig {
  static HttpLink link = HttpLink(
    uri: 'https://hagglex-backend-staging.herokuapp.com/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}
