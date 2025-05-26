import 'dart:io';

import '/core/app_export.dart';

class Formdata {
  /// Converts a [Map] of data into [FormData] suitable for HTTP requests.
  static Future<FormData> fromMap(Map<String, dynamic>? data) async {
    final formData = FormData();

    /// Processes individual entries based on their type.
    Future<void> processEntry(String key, dynamic value) async {
      if (value == null) {
        // Skip null values
        return;
      } else if (value is File) {
        // Handle file uploads
        final fileName = value.path.split('/').last;
        console.log('Processing file: $fileName');
        formData.files.add(MapEntry(
          key,
          await MultipartFile.fromFile(value.path, filename: fileName),
        ));
      } else if (value is List) {
        // Handle lists by appending each element
        for (var i = 0; i < value.length; i++) {
          await processEntry('$key[$i]', value[i]);
        }
      } else if (value is Map<String, dynamic>) {
        // Handle nested maps
        for (var nestedKey in value.keys) {
          await processEntry('$key[$nestedKey]', value[nestedKey]);
        }
      } else if (value is DateTime) {
        // Convert DateTime to ISO 8601 string
        console.log('Processing DateTime: ${value.toIso8601String()}');
        formData.fields.add(MapEntry(key, value.toIso8601String()));
      } else if (value is bool || value is num || value is String) {
        // Handle basic data types
        console.log('Processing field: $key = $value');
        formData.fields.add(MapEntry(key, value.toString()));
      } else {
        // Handle unsupported data types
        throw UnsupportedError('Unsupported data type: ${value.runtimeType}');
      }
    }

    // Return empty FormData if data is null, otherwise process the entries
    if (data == null) return formData;

    // Process each key-value pair in the provided data using a for loop
    for (var key in data.keys) {
      await processEntry(key, data[key]);
    }

    // Print the final FormData contents
    console.log('\n--- FormData Contents ---');
    console.log('Fields:');
    for (var field in formData.fields) {
      console.log('${field.key}: ${field.value}');
    }
    console.log('\nFiles:');
    for (var file in formData.files) {
      console.log('${file.key}: ${file.value.filename}');
    }
    console.log('-------------------------\n');

    return formData;
  }
}
