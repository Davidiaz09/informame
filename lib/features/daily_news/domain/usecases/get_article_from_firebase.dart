import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetUserArticlesUseCase {
  final ArticleRepository _repository;

  GetUserArticlesUseCase(this._repository);

  Future<List<Map<String, dynamic>>> call() {
    return _repository.getUserArticles();
  }
}
