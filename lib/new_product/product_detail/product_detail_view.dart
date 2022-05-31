import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_detail_bloc.dart';
import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductDetailBloc()..add(InitEvent(productId)),
      child: Builder(
        builder: (context) => Scaffold(
          body: const ProductDetail(),
          appBar: AppBar(),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        switch (state.state) {
          case ProductDetailViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProductDetailViewState.loaded:
            return Card(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Modelo: ${state.product?.modelProduct}'),
                  Text('Formato: ${state.product?.formatProduct}'),
                  const Divider(
                    height: 8.0,
                  ),
                  const Text('Infomación Adicional'),
                  Text('Descripcion: ${state.product?.descriptionProduct}'),
                  Text('Código: ${state.product?.codeProduct}'),
                  Text('Familia: ${state.product?.familyProduct}'),
                  Text('Acabado: ${state.product?.finishProduct}'),
                  Text('Marca: ${state.product?.brandProduct}'),
                  Text('Origen: ${state.product?.originProduct}'),
                  const Divider(
                    height: 8.0,
                  ),
                  const Text('Informacion Técnica'),
                  Text(
                      'Unidad de Medida: ${state.product?.unitMeasureProduct}'),
                  Text('Unidades por Caja: ${state.product?.unitsBoxProduct}'),
                  Text('Area por Caja: ${state.product?.areaBoxProduct}'),
                  Text(
                      'Cajas por Pallet: ${state.product?.boxesPalletProduct}'),
                  Text('Area por Pallet: ${state.product?.areaPalletProduct}'),
                  Text('Peso por Caja: ${state.product?.weightBoxProduct}'),
                  Text(
                      'Peso por Pallet: ${state.product?.weightPalletProduct}'),
                ],
              ),
            );

          case ProductDetailViewState.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}
