import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/keep_entity.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBKeep extends GetxService {
  late Database dbBase;

  Future<DBKeep> init() async {
    await createKeepDB();
    return this;
  }

  createKeepDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'keep.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createKeepTable(db);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('targetKcal', 5000);
        });
  }

  createKeepTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS keep (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, kcal INTEGER, event TEXT)');
  }

  insertKeepData(KeepEntity entity) async {
    final id = await dbBase.insert('keep', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'kcal': entity.kcal,
      'event': entity.event,
    });
    return id;
  }

  cleanKeepData() async {
    await dbBase.delete('keep');
  }

  Future<List<KeepEntity>> getKeepAllData() async {
    var result = await dbBase.query('keep', orderBy: 'createdTime DESC');
    return result.map((e) => KeepEntity.fromJson(e)).toList();
  }
}
