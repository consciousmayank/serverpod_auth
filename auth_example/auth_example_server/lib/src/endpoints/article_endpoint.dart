import 'package:serverpod/serverpod.dart';

import '../generated/article_class.dart';

class ArticleEndpoint extends Endpoint {
  
  ///Fetch Articles from DB
  Future<List<Article>> getArticles(
    Session session, {
    String? title,
  }) async {
    return await Article.find(session,
        where: (t) =>
            title != null ? t.title.like('%$title%') : Constant(true));
  }

  Future<bool> addArticle(Session session, {required Article article,}) async {
    try {
  await Article.insert(session, article);
} on Exception catch (e) {
  session.log(e.toString(), level: LogLevel.error);
  return false;
}
    return true;
  }

  Future<bool> updateArticle(Session session, {required Article article,}) async {
    return await Article.update(session, article);
  }

  Future<bool> deleteArticle(Session session, {required int articleId,}) async {
    return await Article.delete(session, where: (t) => t.id.equals(articleId),) == 1;
  }
}
