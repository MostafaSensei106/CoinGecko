import 'package:shared_preferences/shared_preferences.dart';

/// A singleton wrapper for SharedPreferences providing type-safe operations
///
/// Usage:
/// ```dart
/// // Initialize in main.dart
/// await SharedPreferencesGlobal.instance.initialize();
///
/// // Save value
/// await SharedPreferencesGlobal.instance.setValue<String>('key', 'value');
///
/// // Get value
/// final value = SharedPreferencesGlobal.instance.getValue<String>('key');
/// ```
class SharedPreferencesGlobal {
  SharedPreferencesGlobal._();

  static final SharedPreferencesGlobal instance = SharedPreferencesGlobal._();

  SharedPreferences? _prefs;

  /// Initialize SharedPreferences instance
  /// Must be called before using any other methods
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Ensures SharedPreferences is initialized
  void _ensureInitialized() {
    if (_prefs == null) {
      throw StateError(
        'SharedPreferencesGlobal not initialized. '
        'Call initialize() before using.',
      );
    }
  }

  /// Save a value with type safety
  Future<bool> setValue<T>(String key, T value) async {
    _ensureInitialized();

    if (value is String) {
      return await _prefs!.setString(key, value);
    } else if (value is bool) {
      return await _prefs!.setBool(key, value);
    } else if (value is int) {
      return await _prefs!.setInt(key, value);
    } else if (value is double) {
      return await _prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _prefs!.setStringList(key, value);
    } else {
      throw UnsupportedError(
        'Unsupported type: ${T.toString()}. '
        'Supported types: String, bool, int, double, List<String>',
      );
    }
  }

  /// Get a value with type safety and optional default value
  T? getValue<T>(String key, {T? defaultValue}) {
    _ensureInitialized();

    if (T == String) {
      return (_prefs!.getString(key) ?? defaultValue) as T?;
    } else if (T == bool) {
      return (_prefs!.getBool(key) ?? defaultValue) as T?;
    } else if (T == int) {
      return (_prefs!.getInt(key) ?? defaultValue) as T?;
    } else if (T == double) {
      return (_prefs!.getDouble(key) ?? defaultValue) as T?;
    } else if (T == List<String>) {
      return (_prefs!.getStringList(key) ?? defaultValue) as T?;
    } else {
      throw UnsupportedError(
        'Unsupported type: ${T.toString()}. '
        'Supported types: String, bool, int, double, List<String>',
      );
    }
  }

  /// Get a required value (throws if not found)
  T getRequiredValue<T>(String key) {
    final value = getValue<T>(key);
    if (value == null) {
      throw StateError('Required key "$key" not found in SharedPreferences');
    }
    return value;
  }

  /// Update an existing value using a callback function
  Future<bool> updateValue<T>(
    String key,
    T Function(T? currentValue) updateFn,
  ) async {
    _ensureInitialized();

    final currentValue = getValue<T>(key);
    final newValue = updateFn(currentValue);

    if (newValue == null) {
      return await deleteValue(key);
    }

    return await setValue<T>(key, newValue);
  }

  /// Delete a specific key
  Future<bool> deleteValue(String key) async {
    _ensureInitialized();
    return await _prefs!.remove(key);
  }

  /// Check if a key exists
  bool containsKey(String key) {
    _ensureInitialized();
    return _prefs!.containsKey(key);
  }

  /// Get all keys
  Set<String> getAllKeys() {
    _ensureInitialized();
    return _prefs!.getKeys();
  }

  /// Clear all stored data
  Future<bool> clearAll() async {
    _ensureInitialized();
    return await _prefs!.clear();
  }

  /// Reload preferences from disk
  Future<void> reload() async {
    _ensureInitialized();
    await _prefs!.reload();
  }

  /// Check if SharedPreferences is initialized
  bool get isInitialized => _prefs != null;
}

/*
Usage Examples:

1. Initialize in main.dart:
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await SharedPreferencesGlobal.instance.initialize();
     runApp(MyApp());
   }
   ```

2. Save values:
   ```dart
   // Using generic method
   await SharedPreferencesGlobal.instance.setValue<String>('username', 'Ahmed');

   // Using extension methods
   await SharedPreferencesGlobal.instance.setString('username', 'Ahmed');
   await SharedPreferencesGlobal.instance.setBool('isLogin', true);
   await SharedPreferencesGlobal.instance.setInt('age', 25);
   ```

3. Get values with default:
   ```dart
   final username = SharedPreferencesGlobal.instance.getValue<String>(
     'username',
     defaultValue: 'Guest',
   );

   // Or using extension
   final isLogin = SharedPreferencesGlobal.instance.getBool(
     'isLogin',
     defaultValue: false,
   );
   ```

4. Update values:
   ```dart
   await SharedPreferencesGlobal.instance.updateValue<int>(
     'loginCount',
     (current) => (current ?? 0) + 1,
   );
   ```

5. Check existence:
   ```dart
   if (SharedPreferencesGlobal.instance.containsKey('username')) {
     // Key exists
   }
   ```

6. Delete value:
   ```dart
   await SharedPreferencesGlobal.instance.deleteValue('username');
   ```

7. Clear all:
   ```dart
   await SharedPreferencesGlobal.instance.clearAll();
   ```
*/
