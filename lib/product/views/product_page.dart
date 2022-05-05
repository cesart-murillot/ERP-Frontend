import 'package:erp_fronted/product/bloc/product_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text('Press me'),
          );
        } else if (state is ProductLoaded) {
          return ListView.builder(
            itemCount: state.products!.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(child: ListTile(
                title: Text(state.products!.products[index].name),
              ),);
            },
          );
        }
        return const Text('Pres');
      },
    );
  }
}
