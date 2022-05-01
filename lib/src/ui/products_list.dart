import 'package:erp_fronted/src/blocs/products_bloc.dart';
import 'package:erp_fronted/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchProductData();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: StreamBuilder(
        stream: bloc.data,
        builder: (context, AsyncSnapshot<ProductData?> snapshot) {
          if (snapshot.hasData) {
            return listViewer(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ProductData?> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data?.data.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Text(snapshot.data?.data[index].name ?? "hello");
        });
  }

  Widget listViewer(AsyncSnapshot<ProductData?> snapshot) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: snapshot.data?.data.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          child: Text(snapshot.data?.data[index].name ?? 'failed to load'),
        );
      });
  }
}
