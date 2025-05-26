import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class Pickers {
  static Future<XFile?> image({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
    ImageSource source = ImageSource.gallery,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    ImagePicker picker = ImagePicker();
    return picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      requestFullMetadata: requestFullMetadata,
      preferredCameraDevice: preferredCameraDevice,
    );
  }

  static Future<XFile?> video({
    Duration? maxDuration,
    ImageSource source = ImageSource.gallery,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    ImagePicker picker = ImagePicker();
    return picker.pickVideo(
      source: source,
      maxDuration: maxDuration,
      preferredCameraDevice: preferredCameraDevice,
    );
  }

  static Future<XFile?> media({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    ImagePicker picker = ImagePicker();
    return picker.pickMedia(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      requestFullMetadata: requestFullMetadata,
    );
  }

  static Future<List<XFile>?> multiImage({
    int? limit,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    ImagePicker picker = ImagePicker();
    return picker.pickMultiImage(
      limit: limit,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      requestFullMetadata: requestFullMetadata,
    );
  }

  static Future<List<XFile>?> multimedia({
    int? limit,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    ImagePicker picker = ImagePicker();
    return picker.pickMultipleMedia(
      limit: limit,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      requestFullMetadata: requestFullMetadata,
    );
  }

  static Future<File?> file({
    String? dialogTitle,
    bool withData = false,
    String? initialDirectory,
    bool allowMultiple = false,
    int compressionQuality = 30,
    bool withReadStream = false,
    bool readSequential = false,
    FileType type = FileType.any,
    bool allowCompression = true,
    bool lockParentWindow = false,
    List<String>? allowedExtensions,
    dynamic Function(FilePickerStatus)? onFileLoading,
  }) async {
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles(
      type: type,
      withData: withData,
      dialogTitle: dialogTitle,
      allowMultiple: allowMultiple,
      onFileLoading: onFileLoading,
      readSequential: readSequential,
      withReadStream: withReadStream,
      lockParentWindow: lockParentWindow,
      initialDirectory: initialDirectory,
      allowedExtensions: allowedExtensions,
      compressionQuality: compressionQuality,
    );

    if (result != null && result.files.isNotEmpty) {
      if (allowMultiple) {
        return File(result.files.first.path!);
      } else {
        return File(result.files.single.path!);
      }
    }
    return null;
  }

  static Future<DateTime?> year(
    BuildContext context, {
    DateTime? currentDate,
    DateTime? initialDate,
    required DateTime lastDate,
    required DateTime firstDate,
    required DateTime selectedDate,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) {
    return showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: appTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            'Select Year',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: appTheme.whiteA700,
              fontSize: 20.fSize,
            ),
          ),
          content: Container(
            height: 300.h,
            width: 300.h,
            decoration: BoxDecoration(
              color: appTheme.primary,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: appTheme.primary,
                  onPrimary: appTheme.whiteA700,
                  onSurface: appTheme.primary,
                ),
                datePickerTheme: DatePickerThemeData(
                  backgroundColor: appTheme.primary,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    backgroundColor: appTheme.primary,
                    foregroundColor: appTheme.whiteA700,
                    textStyle: TextStyle(fontSize: 14.fSize),
                  ),
                ),
                dialogTheme: DialogThemeData(backgroundColor: appTheme.primary),
              ),
              child: YearPicker(
                lastDate: lastDate,
                firstDate: firstDate,
                currentDate: currentDate,
                selectedDate: selectedDate,
                onChanged: (DateTime date) {
                  Navigator.of(context).pop(date);
                },
              ),
            ),
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }

  static Future<DateTime?> date(
    BuildContext context, {
    Locale? locale,
    String? helpText,
    DateTime? lastDate,
    String? cancelText,
    DateTime? firstDate,
    String? confirmText,
    Offset? anchorPoint,
    DateTime? initialDate,
    DateTime? currentDate,
    String? fieldHintText,
    String? fieldLabelText,
    String? errorFormatText,
    String? errorInvalidText,
    TextInputType? keyboardType,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    bool Function(DateTime)? selectableDayPredicate,
    Widget Function(BuildContext, Widget?)? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    void Function(DatePickerEntryMode)? onDatePickerModeChange,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  }) {
    return showDatePicker(
      locale: locale,
      context: context,
      helpText: helpText,
      cancelText: cancelText,
      currentDate: currentDate,
      confirmText: confirmText,
      anchorPoint: anchorPoint,
      keyboardType: keyboardType,
      routeSettings: routeSettings,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      errorFormatText: errorFormatText,
      initialEntryMode: initialEntryMode,
      useRootNavigator: useRootNavigator,
      errorInvalidText: errorInvalidText,
      lastDate: lastDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1960),
      initialDate: initialDate ?? DateTime.now(),
      initialDatePickerMode: initialDatePickerMode,
      selectableDayPredicate: selectableDayPredicate,
      onDatePickerModeChange: onDatePickerModeChange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appTheme.primary,
              onPrimary: appTheme.whiteA700,
              onSurface: appTheme.primary,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: appTheme.whiteA700,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primary,
                foregroundColor: appTheme.whiteA700,
                textStyle: const TextStyle(
                  fontSize: 16, // Fixed font size
                ),
              ),
            ),
            dialogTheme: DialogThemeData(backgroundColor: appTheme.whiteA700),
          ),
          child: child!,
        );
      },
    ).then((value) {
      return value;
    });
  }

  static Future<TimeOfDay?> time(
    BuildContext context, {
    String? helpText,
    String? cancelText,
    String? confirmText,
    Offset? anchorPoint,
    String? hourLabelText,
    TimeOfDay? initialTime,
    String? minuteLabelText,
    String? errorInvalidText,
    Orientation? orientation,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Widget Function(BuildContext, Widget?)? builder,
    void Function(TimePickerEntryMode)? onEntryModeChanged,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  }) {
    return showTimePicker(
      context: context,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      anchorPoint: anchorPoint,
      orientation: orientation,
      routeSettings: routeSettings,
      hourLabelText: hourLabelText,
      minuteLabelText: minuteLabelText,
      initialEntryMode: initialEntryMode,
      useRootNavigator: useRootNavigator,
      errorInvalidText: errorInvalidText,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appTheme.primary,
              onPrimary: appTheme.whiteA700,
              onSurface: appTheme.primary,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: appTheme.whiteA700,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primary,
                foregroundColor: appTheme.whiteA700,
                textStyle: const TextStyle(
                  fontSize: 16, // Fixed font size
                ),
              ),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: appTheme.whiteA700,
            ),
            dialogTheme: DialogThemeData(backgroundColor: appTheme.whiteA700),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }
}
