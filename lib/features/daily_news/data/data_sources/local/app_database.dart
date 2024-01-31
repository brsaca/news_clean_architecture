import 'package:floor/floor.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/local/DAO/article_dao.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:sqlite3/sqlite3.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDAO get articleDAO;
}
