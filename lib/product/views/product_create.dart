import 'package:erp_fronted/product/bloc/product_create_bloc/product_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCreatePage extends StatelessWidget {
  ProductCreatePage({Key? key}) : super(key: key);
  final _createFormKey = GlobalKey<FormState>();
  final List<String> productValues = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ModelProductDropDownCubit()..fetchModelProduct()),
        BlocProvider(create: (_) => ModelProductDropDownSelectCubit()),
        BlocProvider(create: (_) => ProductCreateSaveData()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Añadir Producto'),
/*          actions: [
            BlocBuilder<ProductCreateSaveData, String>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<ProductCreateSaveData>().printData();
                  },
                  icon: const Icon(Icons.save),
                );
              },
            ),
          ],*/
        ),
        body: Form(
          key: _createFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ModelProduct(),
                const FormatProduct(),
                const DescriptionProduct(),
                const AdditionalInformation(),
                const TechnicalInformation(),
                BlocBuilder<ProductCreateSaveData, String>(
                    builder: (context, state) {
                  return OutlinedButton(
                    onPressed: () {
                      _createFormKey.currentState?.save();
                      context.read<ProductCreateSaveData>().printData();
                    },
                    child: const Text('Registrar'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ModelProduct extends StatelessWidget {
  const ModelProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Modelo'),
      onSaved: (value) {
        BlocProvider.of<ProductCreateSaveData>(context)
            .saveData({'model_product': value});
      },
    );
  }
}

class DescriptionProduct extends StatelessWidget {
  const DescriptionProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Descripción',
      ),
      onSaved: (value) {
        BlocProvider.of<ProductCreateSaveData>(context)
            .saveData({'description_product': value});
      },
    );
  }
}

class FormatProduct extends StatelessWidget {
  const FormatProduct({Key? key}) : super(key: key);

  //String initialValue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: BlocProvider.of<ModelProductDropDownSelectCubit>(context,
              listen: true)
          .state,
      isExpanded: true,
      onChanged: (String? newValue) {
        BlocProvider.of<ModelProductDropDownSelectCubit>(context)
            .selectModelProduct(newValue!);
        //initialValue = BlocProvider.of<ModelProductDropDownSelectCubit>(context).state;
      },
      items: BlocProvider.of<ModelProductDropDownCubit>(context).state,
      onSaved: (value) {
        BlocProvider.of<ProductCreateSaveData>(context)
            .saveData({'format_product': value});
      },
    );
  }
}

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCreateShowAdditionalInformation(),
      child: BlocBuilder<ProductCreateShowAdditionalInformation, bool>(
          builder: (context, showAdditionalInfo) {
        if (!showAdditionalInfo) {
          return TextButton(
            onPressed: () {
              context
                  .read<ProductCreateShowAdditionalInformation>()
                  .showAdditionalInformation();
            },
            child: const Text('Añadir Informaciòn Adicional'),
          );
        }
        if (showAdditionalInfo) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  context
                      .read<ProductCreateShowAdditionalInformation>()
                      .hideAdditionalInformation();
                },
                child: const Text('Ocultar Información Adicional'),
              ),
              const ProductFormField(
                  keyMap: 'code_product', label: 'Código', numeric: false),
              const ProductFormField(
                  keyMap: 'family_product', label: 'Familia', numeric: false),
              const ProductFormField(
                  keyMap: 'finish_product', label: 'Acabado', numeric: false),
              const ProductFormField(
                  keyMap: 'code_product', label: 'Código', numeric: false),
              const ProductFormField(
                  keyMap: 'brand_product', label: 'Marca', numeric: false),
              const ProductFormField(
                  keyMap: 'origin_product', label: 'Origen', numeric: false),
            ],
          );
        }
        return const Text('error');
      }),
    );
  }
}

class TechnicalInformation extends StatelessWidget {
  const TechnicalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCreateShowTechnicalInformation(),
      child: BlocBuilder<ProductCreateShowTechnicalInformation, bool>(
        builder: (context, showTechnicalInformation) {
          if (!showTechnicalInformation) {
            return TextButton(
              onPressed: () {
                context
                    .read<ProductCreateShowTechnicalInformation>()
                    .showTechnicalInformation();
              },
              child: const Text('Mostar Información Técnica'),
            );
          }
          if (showTechnicalInformation) {
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    context
                        .read<ProductCreateShowTechnicalInformation>()
                        .hideTechnicalInformation();
                  },
                  child: const Text('Ocultar Información Técnica'),
                ),
                const ProductFormField(
                    keyMap: 'unit_measure_product',
                    label: 'Unidad de Medida',
                    numeric: false),
                const ProductFormField(
                    keyMap: 'units_box_product',
                    label: 'Unidades por Caja',
                    numeric: true),
                const ProductFormField(
                    keyMap: 'area_box_product',
                    label: 'Area por Caja',
                    numeric: true),
                const ProductFormField(
                    keyMap: 'boxes_pallet_product',
                    label: 'Cajas por Pallet',
                    numeric: true),
                const ProductFormField(
                    keyMap: 'area_pallet_product',
                    label: 'Area por Pallet',
                    numeric: true),
                const ProductFormField(
                    keyMap: 'weight_box_product',
                    label: 'Peso por Caja',
                    numeric: true),
                const ProductFormField(
                    keyMap: 'weight_pallet_product',
                    label: 'Peso por Pallet',
                    numeric: true),
              ],
            );
          }
          return const Text('error');
        },
      ),
    );
  }
}

class ProductFormField extends StatelessWidget {
  const ProductFormField({
    Key? key,
    required this.keyMap,
    required this.label,
    required this.numeric,
  }) : super(key: key);
  final String keyMap;
  final String label;
  final bool numeric;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        if (numeric)
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: label,
      ),
      onSaved: (value) {
        if (value!.isNotEmpty) {
          if (!numeric) {
            BlocProvider.of<ProductCreateSaveData>(context)
                .saveData({keyMap: value});
          }
          if (numeric) {
            BlocProvider.of<ProductCreateSaveData>(context)
                .saveData({keyMap: double.parse(value)});
          }
        }
      },
    );
  }
}
