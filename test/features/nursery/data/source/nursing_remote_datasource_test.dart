import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/features/nursery/data/models/hospital_model.dart';
import 'package:napd/features/nursery/data/source/nursing_remote_datasource.dart';

class MockApiConsumer extends Mock implements ApiConsumer {}

void main() {
  late MockApiConsumer mockApiConsumer;
  late NursingRemoteDatasourceImpl nursingRemoteDataSource;

  setUp(() {
    mockApiConsumer = MockApiConsumer();
    nursingRemoteDataSource =
        NursingRemoteDatasourceImpl(apiConsumer: mockApiConsumer);
  });

  test(
    'should return list of hospitals when call getAllHospitals success',
    () async {
      // arrange
      List<HospitalModel> tHospitals = List.generate(
        4,
        (_) {
          return HospitalModel(
            id: 1,
            description: 'desc',
            title: 'title',
            imageUrl: 'imageUrl',
            governorateName: 'governorateName',
            rate: 4,
            isFavourite: true,
            isopended: true,
          );
        },
      );

      final tHospitalMap = tHospitals.map((e) => e.toJson()).toList();
      when(() => mockApiConsumer.get(EndPoints.getAllHospital)).thenAnswer(
        (_) async => Future.value(
          Response(
            requestOptions: RequestOptions(path: EndPoints.getAllHospital),
            data: tHospitalMap,
            statusCode: 200,
          ),
        ),
      );
      // act
      final res = await nursingRemoteDataSource.getAllHospitals();
      // assert
      expect(res, equals(tHospitals));
      verify(() => mockApiConsumer.get(EndPoints.getAllHospital)).called(1);
    },
  );
}
