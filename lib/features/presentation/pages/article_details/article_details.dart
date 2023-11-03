
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:newsapp/Local/local/local_article_bloc.dart';
import 'package:newsapp/Local/local/local_article_event.dart';
import 'package:newsapp/features/auth/domain/usecases/entities/article.dart';
import 'package:newsapp/features/injection_container.dart';

class ArticicleDetailsView extends HookWidget {
  final ArticleEntity? article;
  const ArticicleDetailsView({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticlesBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
          builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onBackButtonTapped(context),
                child: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                ),
              )),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title!,
            style: TextStyle(fontFamily: 'Roboto', fontSize: 26),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              const Icon(
                Icons.timeline,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                article!.publishedAt!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.infinity,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        article!.urlToImage!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      child: Text('${article!.description ?? ''}\n\n${article!.content ?? ''}'),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: const Icon(
          Icons.bookmark,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalArticlesBloc>(context).add(SavedArticle(article!));
    const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Article Saved succesfully.'));
  }
}
