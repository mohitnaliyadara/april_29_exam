import 'package:get_storage/get_storage.dart';

import '../locator/locator.dart';

class AppDB {
  static final box = GetStorage();

  getValue<T>(String key, {T? defaultValue}) => box.read(key) ?? defaultValue;

  setValue(String key, dynamic value) => box.write(key, value);

  bool get isLogin => getValue("isLogin", defaultValue: false);

  set isLogin(bool update) => setValue("isLogin", update);
}

final appDB = locator<AppDB>();
