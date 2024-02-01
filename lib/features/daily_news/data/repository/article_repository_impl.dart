import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_clean_architecture/core/constants/constants.dart';
import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      // Aquí realizas la llamada al servicio API para obtener las noticias
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      // Aquí verificas el código de estado de la respuesta HTTP
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // Si la respuesta es exitosa, devuelves un estado de éxito con los datos
        return DataSuccess(httpResponse.data);
      } else {
        // Si la respuesta no es exitosa, devuelves un estado de fallo con la excepción
        return DataFailed(
            DioException(requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      // Capturas y manejas las excepciones relacionadas con Dio (librería HTTP)
      return DataFailed(e);
    }
  }
}
