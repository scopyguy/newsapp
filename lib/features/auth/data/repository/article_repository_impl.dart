import 'package:dio/dio.dart';
import 'package:newsapp/Local/DAO/app_database.dart';
import 'package:newsapp/core/constant/constant.dart';
import 'package:newsapp/core/resources/data_state.dart';
import 'package:newsapp/features/auth/data/data_sources/remote/newsapi_service.dart';
import 'package:newsapp/features/auth/data/models/article.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDataBase;
  ArticleRepositoryImpl(this._newsApiService, this._appDataBase);

  @override
  Future<DataState<List<ArticleModels>>> getNewsArticles() async {
  try
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        islam: islamQuery,
        category: categoryQuery,
      );

      print(httpResponse);
      return const DataSuccess([]);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModels>> getSavedArticles() async {
    return _appDataBase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .deleteArticle(ArticleModels.fromEntity(article));
  }

  @override
  Future<void> savedArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .insertArticle(ArticleModels.fromEntity(article));
  }
  
}
