import 'package:path/path.dart';
import 'package:shop_app_mixin/model/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE cartProduct (
        name TEXT NOT NULL,
        image TEXT NOT NULL,
        price TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        productId TEXT NOT NULL
        )
        ''');
    });
  }

  Future<List<CartProductModel>> getAllProducts() async {
    Database dbClient = await database;
    List<Map> maps = await dbClient.query('cartProduct');

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  insert(CartProductModel model) async {
    Database dbClient = await database;
    await dbClient.insert(
      'cartProduct',
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteProduct(String productId) async {
    Database _db = await database;
    await _db.delete(
      'cartProduct',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  deleteAllProducts() async {
    Database _db = await database;
    await _db.delete(
      'cartProduct',
    );
  }

  updateProduct(CartProductModel model) async {
    Database dbClient = await database;
    await dbClient.update(
      'cartProduct',
      model.toJson(),
      where: 'productId = ?',
      whereArgs: [model.productId],
    );
  }
}
