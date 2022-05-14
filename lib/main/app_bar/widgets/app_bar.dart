import 'package:erp_fronted/product/bloc/product_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/models/product_model.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Main'),
    );
  }
}

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Productos'),
      actions: [
        BlocProvider(
          create: (_) => ProductBloc(Repository()),
          child: IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearch(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}

class InventoryAppBar extends StatelessWidget {
  const InventoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Inventarios'),
    );
  }
}

class BillingAppBar extends StatelessWidget {
  const BillingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Facturacion'),
    );
  }
}

class EmployeeAppBar extends StatelessWidget {
  const EmployeeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Empleados'),
    );
  }
}

class BranchAppBar extends StatelessWidget {
  const BranchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Sucursales'),
    );
  }
}

class ProductSearch extends SearchDelegate<Product?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        //context.read<ProductBloc>().add(ProductEventGetProductList());
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('hola');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //context.read<ProductBloc>().add(ProductEventSuggestProduct(query));
/*    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductStateSuggestedProducts) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.products.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.products.products[index].nameProduct),
                onTap: () {},
              );
            },
          );
        }
        if (state is ProductStateLoadingSuggestedProducts) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Text('error');
      },
    );*/
    context.read<ProductSearchBarBloc>().add(ProductSearchBarEventGetProductSuggestions(query));
    return BlocBuilder<ProductSearchBarBloc, ProductSearchBarState>(
      builder: (context, state) {
        if (state is ProductSearchBarStateProductSuggestions) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.products.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.products.products[index].modelProduct),
                onTap: () {},
              );
            },
          );
        }
        if (state is ProductSearchBarStateLoadingSuggestions) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductSearchBarStateInitial) {
          return const Center(child: Text('Presione en Search para buscar'),);
        }
        return Text('error');
      },
    );
  }
}
