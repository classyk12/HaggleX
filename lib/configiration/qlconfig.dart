import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';

class QLConfig {
  static getClientWithAuth() {
    String token = Storage.read('token');

    HttpLink link = HttpLink(
      uri: 'https://hagglex-backend-staging.herokuapp.com/graphql',
    );

    AuthLink authLink = AuthLink(getToken: () {
      return 'Bearer $token';
    });

    Link lnk = authLink.concat(link);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: lnk,
      ),
    );

    return client;
  }

  static getClientWithoutAuth() {
    HttpLink link = HttpLink(
      uri: 'https://hagglex-backend-staging.herokuapp.com/graphql',
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );

    return client;
  }
}
