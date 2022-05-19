import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/src/resources/object_getter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get object from api', () async {
    final url = preDefinedUri('api/products', {'only': 'model'});
    Products products = await getObject(url, Products.serializer);
    print(products);
  });

  test('description', () async {
    final url = preDefinedUri('api/product_entries', {'verified': 'true'});
    ProductEntries productEntries = await getObject(url, ProductEntries.serializer);
    print(productEntries);
  });

  test('(get single entry)', () async {
    final url = preDefinedUri('api/product_entries/' + 1.toString());
    ProductEntry productEntry = await getObject(url, ProductEntry.serializer);
    print(productEntry);
  });
}