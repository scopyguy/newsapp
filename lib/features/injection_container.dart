import 'package:get_it/get_it.dart';
import 'package:newsapp/Local/DAO/app_database.dart';
import 'package:newsapp/Local/local/local_article_bloc.dart';
import 'package:newsapp/core/usecases/get_article.dart';
import 'package:newsapp/features/auth/data/data_sources/remote/newsapi_service.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/features/auth/data/repository/article_repository_impl.dart';
import 'package:newsapp/features/auth/domain/repository/article_repository.dart';
import 'package:newsapp/features/auth/domain/usecases/get_saved_article.dart';
import 'package:newsapp/features/auth/domain/usecases/remove_article.dart';
import 'package:newsapp/features/auth/domain/usecases/save_article.dart';
import 'package:newsapp/features/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  final dataBase =
      await $FloorAppDataBase.databaseBuilder('app_dataBase.db').build();
  sl.registerSingleton<AppDataBase>(dataBase);
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SavedArticleUseCase>(SavedArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));

  sl.registerFactory<LocalArticlesBloc>(
    () => LocalArticlesBloc(sl(), sl(), sl()),
  );
}
