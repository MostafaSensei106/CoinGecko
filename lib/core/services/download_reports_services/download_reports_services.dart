// / This file contains a service for downloading reports as CSV files.
// /
// / The service is currently commented out but can be enabled by adding the
// / necessary dependencies (`csv` and using `dart:html`). This service is
// / intended for web platforms.

// import 'dart:convert';
// import 'dart:html' as html;

// import 'package:csv/csv.dart';

// / A utility class for downloading reports.
// ignore: avoid_classes_with_only_static_members
// class DownloadReportsServices {
// / Downloads a list of data as a CSV file.
// /
// / - [data]: A list of maps, where each map represents a row in the CSV.
// /   The keys of the first map are used as the header row.
// / - [fileName]: The name of the file to be downloaded.
// /
// / This method is only supported on web platforms.
// /
// / ### Example
// /
// / ```dart
// / final data = [
// /   {'name': 'John', 'age': 30},
// /   {'name': 'Jane', 'age': 25},
// / ];
// / DownloadReportsServices.downloadReportAsCsv(data, fileName: 'users.csv');
// / ```
//   static void downloadReportAsCsv<T extends Map<String, dynamic>>(
//     List<T> data, {
//     String fileName = 'report.csv',
//   }) {
//     if (data.isEmpty) {
//       return;
//     }

//     final csvData = const ListToCsvConverter().convert([
//       data.first.keys.toList(), // header
//       ...data.map((row) => row.values.toList()),
//     ]);

//     final bytes = utf8.encode(csvData);
//     final blob = html.Blob([bytes]);
//     final url = html.Url.createObjectUrlFromBlob(blob);

//     final anchor = html.AnchorElement(href: url)
//       ..setAttribute('download', fileName)
//       ..click();

//     html.Url.revokeObjectUrl(url);
//   }
// }
