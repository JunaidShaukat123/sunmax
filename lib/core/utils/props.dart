import '/core/app_export.dart';

class Props<T> extends GetxController {
  final Rx<int> state;
  final Rx<T?> data;
  final Rx<Paginator> paginator;
  final Rx<String?> error;
  final RxMap<String, dynamic> extra;

  // Constructor to initialize values
  Props({
    int state = 0,
    T? data,
    String? error,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) : state = Rx<int>(state),
       data = Rx<T?>(data),
       error = Rx<String?>(error),
       paginator = Rx<Paginator>(paginator ?? Paginator()),
       extra = RxMap<String, dynamic>(extra);

  // Retrieves the calling trace information for debugging
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
      } else {
        return "$runtimeType::unknown";
      }
    } else {
      return "$runtimeType::unknown";
    }
  }

  // State getters for easier state management
  bool get isNone => state.value == 0;
  bool get isLoading => state.value == 1;
  bool get isSuccess => state.value == 2;
  bool get isError => state.value == 3;
  bool get isProcessing => state.value == 4;
  bool get isProgress => state.value == 5;
  bool get isUploading => state.value == 6;
  bool get isDownloading => state.value == 7;
  bool get isDone => state.value == 20;

  // State transition methods
  void setNone({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(0, error, data, paginator, extra);
  }

  void setLoading({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(1, error, data, paginator, extra);
  }

  void setSuccess({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(2, error, data, paginator, extra);
  }

  void setError({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(3, error ?? "something_went_wrong".tr, data, paginator, extra);
    console.log("State: $state | Error: $error | Trace: $trace");
  }

  void setProcessing({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(4, error, data, paginator, extra);
  }

  void setProgress({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(5, error, data, paginator, extra);
  }

  void setUploading({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(6, error, data, paginator, extra);
  }

  void setDownloading({
    String? error,
    dynamic data,
    Paginator? paginator,
    Map<String, dynamic> extra = const {},
  }) {
    _setState(7, error, data, paginator, extra);
  }

  // Clear state and reset
  void clear({dynamic object}) {
    _setState(0, null, object, paginator.value, extra);
  }

  // Internal method to update state and data
  void _setState(
    int newState,
    String? newError,
    dynamic newData,
    Paginator? newPaginator,
    Map<String, dynamic> newExtra,
  ) {
    state.value = newState;
    error.value = newError;
    data.value = newData;
    extra.value = newExtra;
    paginator.value = newPaginator ?? Paginator();
  }

  // Serialize the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.value,
      'state': state.value,
      'error': error.value,
      'extra': extra,
      'paginator': paginator.value.toJson(),
    };
  }
}
