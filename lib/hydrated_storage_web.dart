import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HydratedStorageWeb extends Storage {
  HydratedStorageWeb() {
    init();
  }

  SharedPreferences? _prefs;
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clear() async {
    await _prefs?.clear();
  }

  @override
  Future<void> delete(String key) async {
    await _prefs?.remove(key);
  }

  @override
  read(String key) {
    return _prefs?.getString(key);
  }

  @override
  Future<void> write(String key, value) async {
    await _prefs?.setString(key, value);
  }
}
