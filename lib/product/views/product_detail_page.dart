import 'package:erp_fronted/product/bloc/product_detail_bloc/product_detail_cubit.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetFieldInfoToUpdateCubit(),
      child: BlocBuilder<GetFieldInfoToUpdateCubit, ProductDetailState>(
        builder: (context, state) {
          return Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GenericFormField(
                      label: 'Modelo',
                      initialValue: product.modelProduct,
                      textStyle: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    GenericFormField(
                      label: 'Descripcion',
                      initialValue: product.descriptionProduct!,
                      textStyle: Theme.of(context).textTheme.bodySmall!,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: GenericFormField(
                            label: 'Código',
                            initialValue: product.codeProduct!,
                            textStyle: Theme.of(context).textTheme.labelSmall!,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Image.network(
                          'https://i.picsum.photos/id/532/200/300.jpg?hmac=77wsdhKY-O9QmZj8Fmkuc_h3fj6nJXCxQcXCRhX4Vos'),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: GenericFormField(
                              label: 'Formato',
                              initialValue: product.formatProduct,
                              textStyle: Theme.of(context).textTheme.subtitle1!,
                              labelWidget: 'Formato',
                            ),
                          ),
                          Flexible(
                            child: GenericFormField(
                              label: 'Acabado',
                              initialValue: product.finishProduct!,
                              textStyle: Theme.of(context).textTheme.subtitle1!,
                              labelWidget: 'Acabado',
                            ),
                          )
                        ],
                      ),
                    ),
                    GenericFormField(
                      label: 'Marca',
                      initialValue: product.brandProduct!,
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Marca',
                    ),
                    GenericFormField(
                      label: 'Origen',
                      initialValue: product.originProduct!,
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Origen',
                    ),
                    GenericFormField(
                      label: 'Unidad de Medida',
                      initialValue: product.unitMeasureProduct!,
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Unidad de Medida',
                    ),
                    GenericFormField(
                      label: 'Unidades por Caja',
                      initialValue: product.unitsBoxProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Unidades por Caja',
                    ),
                    GenericFormField(
                      label: 'Area por Caja',
                      initialValue: product.areaBoxProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Area por Caja',
                    ),
                    GenericFormField(
                      label: 'Cajas por Pallet',
                      initialValue: product.boxesPalletProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Cajas por Pallet',
                    ),
                    GenericFormField(
                      label: 'Area del Pallet',
                      initialValue: product.areaPalletProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Area del Pallet',
                    ),
                    GenericFormField(
                      label: 'Peso por Caja',
                      initialValue: product.weightBoxProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Peso por Caja',
                    ),
                    GenericFormField(
                      label: 'Peso por Pallet',
                      initialValue: product.weightPalletProduct.toString(),
                      textStyle: Theme.of(context).textTheme.subtitle1!,
                      labelWidget: 'Peso por Pallet',
                    )
                    

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GenericFormField extends StatelessWidget {
  const GenericFormField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.textStyle,
    this.labelWidget,
  }) : super(key: key);

  final String label;
  final String initialValue;
  final TextStyle textStyle;
  final String? labelWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FieldEditableCubit(),
      child: BlocBuilder<FieldEditableCubit, bool>(
        builder: (context, editable) {
          if (editable) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    initialValue: initialValue,
                    decoration: InputDecoration(
                      labelText: label,
                    ),
                    onChanged: (value) {
                      context
                          .read<GetFieldInfoToUpdateCubit>()
                          .add(ProductDetailEventPostProductChanges(value));
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<FieldEditableCubit>().makeItUneditable();
                  },
                  icon: const Icon(Icons.keyboard_return),
                )
              ],
            );
          }
          if (!editable) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (labelWidget != null)
                  Flexible(
                    child: Text(
                      labelWidget! + ': ',
                      style: textStyle,
                    ),
                  ),
                Flexible(
                  child: Text(
                    initialValue,
                    style: textStyle,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    context.read<FieldEditableCubit>().makeItEditable();
                  },
                ),
              ],
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}
