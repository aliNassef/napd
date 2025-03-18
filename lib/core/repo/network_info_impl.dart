import 'package:connectivity_plus/connectivity_plus.dart';
import 'network_info.dart';

class NetworkInfoImpl extends NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivity = await Connectivity().checkConnectivity();
    return connectivity.contains(ConnectivityResult.none);
  }
}
