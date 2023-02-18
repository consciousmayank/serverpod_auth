import 'package:auth_example_client/auth_example_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class DemopodServerClientService {
  late final Client _client;
  Client get client => _client;

  DemopodServerClientService() {
    _client = Client(
      'http://192.168.29.107:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
  }

  Future<bool> addArticle({required Article newArticle}) async {
    try {
      return await _client.article.addArticle(article: newArticle);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<Article>> fetchAllArticles() async {
    // try {
    //   return await _client.article.getArticles();
    // } on Exception catch (e) {
    //   debugPrint(e.toString());
      return [];
    // }
  }
}
