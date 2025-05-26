import '/core/app_export.dart';

/// A provider class that manages connectivity state and notifies listeners of changes.
class Connectivities extends GetxService {
  var connected = false.obs;
  final Connectivity connectivity = Connectivity();

  /// Gets the current stack trace for debugging purposes.
  /// Parses the stack trace to extract the class and method names of the caller.
  String get trace {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    if (frames.length > 1) {
      final callerFrame = frames[1].trim();
      final regex = RegExp(r'#\d+\s+(\S+)\.(\S+)\s+\(.*\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null) {
        final className = match.group(1);
        final methodName = match.group(2);
        return "$className::$methodName";
      }
    }
    return "$runtimeType::unknown";
  }

  @override
  void onInit() {
    super.onInit();
    Future.wait([listen()]);
  }

  Future<bool> onConnect() async {
    try {
      List<ConnectivityResult> results = await connectivity.checkConnectivity();
      if (results.isNotEmpty && results.first != ConnectivityResult.none) {
        connected.value = true;
        return true;
      } else {
        connected.value = false;
        return false;
      }
    } catch (e) {
      connected.value = false;
      return false;
    }
  }

  /// Starts monitoring the connectivity status and updates the `connected` state.
  Future<void> listen({void Function(bool)? callback}) async {
    connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      bool isOnline =
          results.isNotEmpty && results.first != ConnectivityResult.none;

      connected.value = isOnline;
      callback?.call(isOnline);
    });
  }

  /// Returns `true` if the device is connected, otherwise throws a `NoInternetException`.
  bool get isConnected => connected.value;
}
