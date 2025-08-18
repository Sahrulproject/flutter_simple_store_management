import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kel5_ppkdb3/model/produkmodel.dart';

class DbHelper {
  static Future<Database> _getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'store.db'),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            stock INTEGER
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<int> insertProduct(Product product) async {
    final db = await _getDatabase();
    return db.insert('products', product.toMap());
  }

  static Future<List<Product>> getProducts() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('products');
    return maps.map((e) => Product.fromMap(e)).toList();
  }
}
