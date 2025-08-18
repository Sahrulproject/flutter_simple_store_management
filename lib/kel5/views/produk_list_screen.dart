import 'package:flutter/material.dart';
import 'package:kel5_ppkdb3/db_helper.dart';
import 'package:kel5_ppkdb3/model/produkmodel.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    final list = await DbHelper.getProducts();
    setState(() {
      products = list;
    });
  }

  void _addDummyProduct() async {
    await DbHelper.insertProduct(
        Product(name: "Indomie", price: 3000, stock: 20));
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Produk")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return ListTile(
            title: Text(p.name),
            subtitle: Text("Rp ${p.price} | Stok: ${p.stock}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDummyProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
