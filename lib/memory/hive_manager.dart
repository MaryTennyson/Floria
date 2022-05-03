import 'dart:io';
import 'package:floria/memory/hive_boxes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static HiveManager? _instance;
  static HiveManager get instance {
    _instance ??= HiveManager._init();
    return _instance!;
  }

  HiveManager._init();

  Future<void> hiveInit() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path;
    Hive.init(path);
    await openAllBoxes();
  }

  Future<void> openAllBoxes() async {
    await openBox(HiveBoxes.USER);
    await openBox(HiveBoxes.EVENT);
    await openloginbox(0);
  }

  Future<void> openBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) await Hive.openBox(boxName);
  }

  Future<void> openloginbox(int number) async {
    if (!Hive.isBoxOpen(HiveBoxes.LOGIN)) await Hive.openBox(HiveBoxes.LOGIN);
    HiveManager._instance?.loginControllerBox(HiveBoxes.LOGIN, number);
  }

  Future<void> addMapToBox(String boxName, Map<String, dynamic> map) async {
    Box box = Hive.box(boxName);
    await box.putAll(map);
  }

  Future<void> addListToBox(String boxName, List<dynamic> list) async {
    Box box = Hive.box(boxName);
    await box.put(boxName, list);
  }

  Future<void> addDataToBox(String boxName, dynamic data) async {
    Box box = Hive.box(boxName);
    await box.put(boxName, data);
  }

  Future<void> loginControllerBox(String boxname, int number) async {
    Box box = Hive.box(boxname);
    await box.put(boxname, number);
  }

  int getLoginCount(String boxname) {
    Box box = Hive.box(boxname);
    int temp = box.get(boxname);
    return temp;
  }

  Map<dynamic, dynamic> getMapFromBox(String boxName) {
    Box box = Hive.box(boxName);
    Map<dynamic, dynamic> map = box.toMap();
    return map;
  }

  List<dynamic> getListFromBox(String boxName) {
    Box box = Hive.box(boxName);
    List<dynamic> temp = box.get(boxName);
    return temp;
  }

  dynamic getDataFromBox(String boxName) {
    Box box = Hive.box(boxName);
    dynamic temp = box.get(boxName);
    return temp;
  }

  Future<void> clearData(String boxName) async {
    Box box = Hive.box(boxName);
    await box.clear();
  }

  Future<void> deleteBox(String boxName) async {
    Box box = Hive.box(boxName);
    await box.deleteFromDisk();
  }
}
