import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/config/theme/app_theme.dart';
import 'package:newsapp/core/usecases/get_article.dart';
import 'package:newsapp/features/injection_container.dart';
import 'package:newsapp/features/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:newsapp/features/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:newsapp/features/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<RemoteArticlesBloc>(
      RemoteArticlesBloc([] as GetArticleUseCase));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
        create: (context) => sl()..add(const GetArticles()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const DailyNews(),
        ));
  }
}
