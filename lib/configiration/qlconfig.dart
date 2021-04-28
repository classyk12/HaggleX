import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';

class QLConfig {
  static String token = Storage.read('token');

  static HttpLink link = HttpLink(
    uri: 'https://hagglex-backend-staging.herokuapp.com/graphql',
  );

  static AuthLink authLink = AuthLink(getToken: () {
    return 'Bearer $token';
  });

  static Link lnk = token == null ? link : authLink.concat(link);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: lnk,
    ),
  );
}
