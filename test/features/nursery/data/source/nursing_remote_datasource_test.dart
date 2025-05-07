import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/core/api/api_consumer.dart';
import 'package:napd/core/api/end_ponits.dart';
import 'package:napd/core/errors/exceptions.dart';
import 'package:napd/features/nursery/data/models/governorate_model.dart';
import 'package:napd/features/nursery/data/models/hospital_model.dart';
import 'package:napd/features/nursery/data/source/nursing_remote_datasource.dart';

class MockApiConsumer extends Mock implements ApiConsumer {}

void main() {
  late MockApiConsumer mockApiConsumer;
  late NursingRemoteDatasourceImpl dataSource;

  // Test data
  final tHospitals = List.generate(
    4,
    (_) => HospitalModel(
      id: 1,
      description: 'desc',
      title: 'title',
      imageUrl: 'imageUrl',
      governorateName: 'governorateName',
      rate: 4,
      isFavourite: true,
      isopended: true,
    ),
  );

  final tGovernorates = [
    GovernorateModel(governorateId: 10, governorateName: 'Alexandria'),
    GovernorateModel(governorateId: 10, governorateName: 'Alexandria'),
  ];

  setUp(() {
    mockApiConsumer = MockApiConsumer();
    dataSource = NursingRemoteDatasourceImpl(apiConsumer: mockApiConsumer);
  });

  group('getAllHospitals', () {
    test(
      'should return list of hospitals when API call is successful',
      () async {
        // Arrange
        final tHospitalMap = tHospitals.map((e) => e.toJson()).toList();
        when(() => mockApiConsumer.get(EndPoints.getAllHospital)).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: EndPoints.getAllHospital),
            data: tHospitalMap,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.getAllHospitals();

        // Assert
        expect(result, tHospitals);
        verify(() => mockApiConsumer.get(EndPoints.getAllHospital)).called(1);
        verifyNoMoreInteractions(mockApiConsumer);
      },
    );

    test(
      'should throw ServerException when API call fails',
      () async {
        // Arrange
        when(() => mockApiConsumer.get(EndPoints.getAllHospital)).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: EndPoints.getAllHospital),
            statusCode: 500,
            data: {'message': 'error'},
          ),
        );

        // Act & Assert
        expect(
          () => dataSource.getAllHospitals(),
          throwsA(isA<ServerException>()),
        );
        verify(() => mockApiConsumer.get(EndPoints.getAllHospital)).called(1);
        verifyNoMoreInteractions(mockApiConsumer);
      },
    );
  });

  group('getAllGovernates', () {
    test(
      'should return list of governorates when API call is successful',
      () async {
        // Arrange
        final tGovernorateMap = tGovernorates.map((e) => e.toJson()).toList();
        when(() => mockApiConsumer.get(EndPoints.getAllGovernorates))
            .thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: EndPoints.getAllGovernorates),
            data: tGovernorateMap,
            statusCode: 200,
          ),
        );

        // Act
        final result = await dataSource.getAllGovernates();

        // Assert
        expect(result, tGovernorates);
        verify(() => mockApiConsumer.get(EndPoints.getAllGovernorates))
            .called(1);
        verifyNoMoreInteractions(mockApiConsumer);
      },
    );

    test(
      'should throw ServerException when API call fails',
      () async {
        // Arrange
        when(() => mockApiConsumer.get(EndPoints.getAllGovernorates))
            .thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: EndPoints.getAllGovernorates),
            data: {'message': 'error'},
            statusCode: 500,
          ),
        );

        // Act & Assert
        expect(
          () => dataSource.getAllGovernates(),
          throwsA(isA<ServerException>()),
        );
        verify(() => mockApiConsumer.get(EndPoints.getAllGovernorates))
            .called(1);
        verifyNoMoreInteractions(mockApiConsumer);
      },
    );
  });
}
