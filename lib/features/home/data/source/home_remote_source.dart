import 'package:napd/features/home/data/model/search_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class HomeRemoteSource {
  Future<SearchModel> search(String query);
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final ApiConsumer apiConsumer;
  HomeRemoteSourceImpl(this.apiConsumer);
  @override
  Future<SearchModel> search(String query) async {
    final response = await apiConsumer.get(
      EndPoints.search,
      queryParameters: {'q': query},
    );
    if (response.statusCode == 200) {
      final searchModel = SearchModel.fromJson(response.data);
      return searchModel;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
