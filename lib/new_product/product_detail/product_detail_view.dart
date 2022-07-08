import 'package:erp_fronted/new_product/detail_product_inventory/detail_product_inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Modelo: ${state.product?.modelProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Formato: ${state.product?.formatProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FlutterLogo(size: 128.0),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ActionChip(
                            label: const Text('Historial de Precios'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailProductInventoryPage(
                                    productId: state.product!.id!,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          ActionChip(
                            label: const Text('Stock'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailProductInventoryPage(
                                    productId: state.product!.id!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        height: 8.0,
                      ),
                      Text(
                        'Infomación Adicional',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Descripcion: ${state.product?.descriptionProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Código: ${state.product?.codeProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Familia: ${state.product?.familyProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Acabado: ${state.product?.finishProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Marca: ${state.product?.brandProduct}'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text('Origen: ${state.product?.originProduct}'),
                      const Divider(
                        height: 8.0,
                      ),
                      Text(
                        'Informacion Técnica',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Unidad de Medida: ${state.product?.unitMeasureProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Unidades por Caja: ${state.product?.unitsBoxProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Area por Caja: ${state.product?.areaBoxProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Cajas por Pallet: ${state.product?.boxesPalletProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Area por Pallet: ${state.product?.areaPalletProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Peso por Caja: ${state.product?.weightBoxProduct}',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Peso por Pallet: ${state.product?.weightPalletProduct}',
                      ),
                    ],
                  ),
                ),
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
