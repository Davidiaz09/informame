import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class AddUserArticleUseCase {
  final ArticleRepository _repository;

  AddUserArticleUseCase(this._repository);

  Future<void> call(Map<String, dynamic> articleData) {
    return _repository.addUserArticle(articleData);
  }
}
