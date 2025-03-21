import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:napd/core/repo/network_info.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnection {}

void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl =
        NetworkInfoImpl(connectionChecker: mockInternetConnectionChecker);
  });

  test(
    'should return true when is connected',
    () async {
      // arrange
      when(() => mockInternetConnectionChecker.hasInternetAccess)
          .thenAnswer((_) async => true);
      // act
      final res = await networkInfoImpl.isConnected;
      // assert
      verify(() => mockInternetConnectionChecker.hasInternetAccess);
      expect(res, true);
    },
  );

  test(
    'should return false when is not connected',
    () async {
      // arrange
      when(() => mockInternetConnectionChecker.hasInternetAccess)
          .thenAnswer((_) async => false);
      // act
      final res = await networkInfoImpl.isConnected;
      // assert
      verify(() => mockInternetConnectionChecker.hasInternetAccess);
      expect(res, false);
    },
  );
}
