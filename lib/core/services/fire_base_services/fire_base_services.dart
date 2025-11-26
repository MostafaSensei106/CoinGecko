import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import '../../../firebase_options.dart';

/// A singleton class that provides access to Firebase services.
///
/// This class initializes Firebase and provides easy access to
/// [FirebaseAuth] and [FirebaseFirestore] instances.
class FireBaseServices {
  /// A private constructor to prevent external instantiation.
  FireBaseServices._();

  /// The single instance of the [FireBaseServices] class.
  static final FireBaseServices instance = FireBaseServices._();

  /// Initializes the Firebase app.
  ///
  /// This method should be called in the `main` function of the application
  /// before any other Firebase services are used.
  ///
  /// ### Example
  ///
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await FireBaseServices.instance.init();
  ///   runApp(const MyApp());
  /// }
  /// ```
  // Future<void> init() async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

  /// Returns the [FirebaseAuth] instance.
  FirebaseAuth get auth => FirebaseAuth.instance;

  /// Returns the [FirebaseFirestore] instance.
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
