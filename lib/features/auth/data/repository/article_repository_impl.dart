import 'dart:io';

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
  try
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        islam: islamQuery,
        category: categoryQuery,
      );
     
  }

if (HttpResponse.response.statusCode == HttpStatus.ok){
return DataSuccess(HttpResponse.data);

}else {
  return DataFailed(
    DioError(
     error: HttpResponse.response.statusMessage,
      response: HttpResponse.response,
      type: DioErrorType.response,
      requestOptions: httpResponse.response.requestOptions,
    ),
    );
  
}
} on DioError catch(e){
  return DataFailed(e);
}
}