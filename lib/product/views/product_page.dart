import 'package:erp_fronted/product/bloc/product_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: FlutterLogo()),
            ListTile(
              title: Text('Titulo 1'),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
        elevation: 8.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(Repository())..add(ProductFetch()),
        child: const Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return ElevatedButton(
            onPressed: () {},
            child: const Text('Press me'),
          );
        } else if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.products!.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: const FlutterLogo(),
                  trailing: const FlutterLogo(),
                  hoverColor: Colors.lightBlueAccent,
                  onTap: () {},
                  selectedTileColor: Colors.blueGrey,
                  tileColor: Colors.greenAccent,
                  title: Text(state.products!.products[index].name),
                  subtitle: Text(
                      state.products!.products[index].units_box.toString()),
                  contentPadding: const EdgeInsets.all(10.0),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(

    );
  }
}

