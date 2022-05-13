import 'package:erp_fronted/product/bloc/product_detail_bloc/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: const [
            SizedBox(
              height: 8.0,
            ),
            ProductName(productName: 'Ejemplo'),
            SizedBox(
              height: 8.0,
            ),
            ProductDetail(productDetail: 'productDetail'),
            FormFields()
          ],
        ),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({Key? key, required this.productName}) : super(key: key);
  final String productName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductNameEditable(),
      child: BlocBuilder<ProductNameEditable, bool>(
        builder: (context, state) {
          if (state) {
            return Row(
              children: [
                Flexible(
                  child: TextFormField(
                    initialValue: productName,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context.read<ProductNameEditable>().makeItUneditable();
                    },
                    icon: const Icon(Icons.close))
              ],
            );
          }
          if (!state) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    productName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context.read<ProductNameEditable>().makeItEditable();
                    },
                    icon: const Icon(Icons.edit))
              ],
            );
          }
          return const Text('error');
        },
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.productDetail})
      : super(key: key);
  final String productDetail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductNameEditable(),
      child: BlocBuilder<ProductNameEditable, bool>(
        builder: (context, state) {
          if (state) {
            return TextFormField(
              initialValue: productDetail,
            );
          }
          if (!state) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  productDetail,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              onTap: () => context.read<ProductNameEditable>().makeItEditable(),
            );
          }
          return const Text('error');
        },
      ),
    );
  }
}

class FormFields extends StatelessWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductNameEditable(),
      child: Container(
        child: Column(
          children: const [
            FieldForm(fieldForm: 'fieldForm1'),
            FieldForm(fieldForm: 'fieldForm2'),
            FieldForm(fieldForm: 'fieldForm3'),
          ],
        ),
      ),
    );
  }
}

class FieldForm extends StatelessWidget {
  const FieldForm({Key? key, required this.fieldForm}) : super(key: key);
  final String fieldForm;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductNameEditable, bool>(
      builder: (context, state) {
        if (state) {
          return Row(
            children: [
              Flexible(
                child: TextFormField(
                  initialValue: fieldForm,
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<ProductNameEditable>().makeItUneditable();
                  },
                  icon: const Icon(Icons.close))
            ],
          );
        }
        if (!state) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  fieldForm,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<ProductNameEditable>().makeItEditable();
                  },
                  icon: const Icon(Icons.edit))
            ],
          );
        }
        return const Text('error');
      },
    );
  }
}
