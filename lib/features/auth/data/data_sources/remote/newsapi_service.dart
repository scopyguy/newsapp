import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:newsapp/core/constant/constant.dart';
import 'package:newsapp/features/auth/data/models/article.dart';

part 'newsapi_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/everything?q=Islam&from=2023-10-20&sortBy=popularity')
  Future<List<ArticleModels>?> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("islam") String? islam,
    @Query("category") String? category,
  });
}
