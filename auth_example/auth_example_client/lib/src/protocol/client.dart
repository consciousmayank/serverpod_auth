/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_auth_client/module.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointArticle extends _i1.EndpointRef {
  _EndpointArticle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'article';

  ///Fetch Articles from DB
  _i2.Future<List<dynamic>> getArticles({String? title}) =>
      caller.callServerEndpoint<List<dynamic>>(
        'article',
        'getArticles',
        {'title': title},
      );

  _i2.Future<bool> addArticle({required dynamic article}) =>
      caller.callServerEndpoint<bool>(
        'article',
        'addArticle',
        {'article': article},
      );

  _i2.Future<bool> updateArticle({required dynamic article}) =>
      caller.callServerEndpoint<bool>(
        'article',
        'updateArticle',
        {'article': article},
      );

  _i2.Future<bool> deleteArticle({required int articleId}) =>
      caller.callServerEndpoint<bool>(
        'article',
        'deleteArticle',
        {'articleId': articleId},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i3.Caller(client);
  }

  late final _i3.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    article = _EndpointArticle(this);
    example = _EndpointExample(this);
    modules = _Modules(this);
  }

  late final _EndpointArticle article;

  late final _EndpointExample example;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'article': article,
        'example': example,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
