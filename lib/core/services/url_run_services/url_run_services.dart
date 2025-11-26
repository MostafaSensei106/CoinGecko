import 'package:url_launcher/url_launcher.dart';
// import '../../widgets/app_toast/app_toast.dart';

/// Launches the given [url] in an external application.
///
/// - [url]: The URL to launch.
///
/// Throws an [Exception] if the URL cannot be launched. If an exception
/// occurs, an error toast is shown to the user.
///
/// ### Example
///
/// ```dart
/// launchURL('https://www.google.com');
/// ```
Future<void> launchURL(final String url) async {
  try {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    // showErrorToast(e.toString());
  }
}
