import 'package:erp_fronted/src/blocs/products_bloc.dart';
import 'package:erp_fronted/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
              icon: const Icon(Icons.search))
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              label: "Press"),
        ],
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
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text(
                    snapshot.data?.data[index].brand_product ?? 'No brand'),
                leading: const FlutterLogo(),
                title:
                    Text(snapshot.data?.data[index].name ?? 'failed to load'),
                onTap: () {
                  return;
                },
              ),
            ),
          );
        });
  }
}

class ProductSearch extends SearchDelegate<ProductData?> {

  @override
  List<Widget>? buildActions(BuildContext context) {
    //throw UnimplementedError();
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text(query);
  }
}
