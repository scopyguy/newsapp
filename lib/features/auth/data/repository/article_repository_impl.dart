import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsapp/core/constant/constant.dart';
import 'package:newsapp/core/resources/data_state.dart';
import 'package:newsapp/features/auth/data/data_sources/remote/newsapi_service.dart';
import 'package:newsapp/features/auth/data/models/article.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModels>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        islam: islamQuery,
        category: categoryQuery,
      );

      print(httpResponse);
      return DataSuccess([]);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
