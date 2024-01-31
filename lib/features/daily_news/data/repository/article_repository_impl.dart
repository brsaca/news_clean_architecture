import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }

}