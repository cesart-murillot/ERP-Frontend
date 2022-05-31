import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_add_bloc.dart';
import 'product_add_event.dart';
import 'product_add_state.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductAddBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: ProductAdd(),
        ),
      ),
    );
  }
}

class ProductAdd extends StatelessWidget {
  ProductAdd({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductAddBloc, ProductAddState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GeneralInformation(),
                const Divider(
                  height: 8.0,
                ),
                state.showAdditionalInformation
                    ? AdditionalInformation()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.read<ProductAddBloc>().add(ShowAddInfoEvent(
                                true, state.showTechnicalInformation));
                          },
                          child: const Text('Información Adicional'),
                        ),
                      ),
                const Divider(
                  height: 8.0,
                ),
                state.showTechnicalInformation
                    ? TechnicalInformation()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.read<ProductAddBloc>().add(ShowAddInfoEvent(
                                state.showAdditionalInformation, true));
                          },
                          child: const Text('Información Técnica'),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GeneralInformation extends StatelessWidget {
  GeneralInformation({Key? key}) : super(key: key);

  final TextEditingController model = TextEditingController();
  final TextEditingController format = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Información General'),
        TextFormField(
          controller: model,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Modelo del Producto',
            icon: Icon(Icons.palette_rounded),
          ),
        ),
        TextFormField(
          controller: format,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Formato',
            icon: Icon(Icons.horizontal_rule),
          ),
        )
      ],
    );
  }
}

class AdditionalInformation extends StatelessWidget {
  AdditionalInformation({Key? key}) : super(key: key);

  final TextEditingController description = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController family = TextEditingController();
  final TextEditingController finish = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController origin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: TextButton(
            onPressed: () {
              context.read<ProductAddBloc>().add(ShowAddInfoEvent(false, BlocProvider.of<ProductAddBloc>(context).state.showTechnicalInformation));
            },
            child: const Text('Ocultar'),
          ),
          alignment: Alignment.centerRight,
        ),
        const Text('Información Adicional'),
        TextFormField(
          controller: description,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Descripción',
            icon: Icon(Icons.insert_drive_file),
          ),
        ),
        TextFormField(
          controller: code,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Código',
            icon: Icon(Icons.code),
          ),
        ),
        TextFormField(
          controller: family,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Familia',
            icon: Icon(Icons.widgets),
          ),
        ),
        TextFormField(
          controller: finish,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Acabado',
            icon: Icon(Icons.fifteen_mp),
          ),
        ),
        TextFormField(
          controller: brand,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Marca',
            icon: Icon(Icons.branding_watermark),
          ),
        ),
        TextFormField(
          controller: origin,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Origen',
            icon: Icon(Icons.flag),
          ),
        ),
      ],
    );
  }
}

class TechnicalInformation extends StatelessWidget {
  TechnicalInformation({Key? key}) : super(key: key);

  final TextEditingController unitMeasure = TextEditingController();
  final TextEditingController unitBox = TextEditingController();
  final TextEditingController areaBox = TextEditingController();
  final TextEditingController boxesPallet = TextEditingController();
  final TextEditingController areaPallet = TextEditingController();
  final TextEditingController weightBox = TextEditingController();
  final TextEditingController weightPallet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: TextButton(
            onPressed: () {
              context.read<ProductAddBloc>().add(ShowAddInfoEvent(BlocProvider.of<ProductAddBloc>(context, listen: false).state.showAdditionalInformation, false));
            },
            child: const Text('Ocultar'),
          ),
          alignment: Alignment.centerRight,
        ),
        const Text('Información Técnica'),
        TextFormField(
          controller: unitMeasure,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Unidad de Medida',
            icon: Icon(Icons.compass_calibration),
          ),
        ),
        TextFormField(
          controller: unitBox,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Unidades por Caja',
            icon: Icon(Icons.ad_units),
          ),
        ),
        TextFormField(
          controller: areaBox,
          onSaved: (value) {},
          decoration: const InputDecoration(
            suffixText: 'm2.',
            labelText: 'Area de la Caja',
            icon: Icon(Icons.area_chart_sharp),
          ),
        ),
        TextFormField(
          controller: boxesPallet,
          onSaved: (value) {},
          decoration: const InputDecoration(
            labelText: 'Cajas por Pallet',
            icon: Icon(Icons.all_inbox_outlined),
          ),
        ),
        TextFormField(
          controller: areaPallet,
          onSaved: (value) {},
          decoration: const InputDecoration(
            suffixText: 'm2.',
            labelText: 'Area por Pallet',
            icon: Icon(Icons.area_chart),
          ),
        ),
        TextFormField(
          controller: weightBox,
          onSaved: (value) {},
          decoration: const InputDecoration(
            suffixText: 'Kg.',
            labelText: 'Peso por Caja',
            icon: Icon(Icons.monitor_weight),
          ),
        ),
        TextFormField(
          controller: weightPallet,
          onSaved: (value) {},
          decoration: const InputDecoration(
            suffixText: 'Kg.',
            labelText: 'Peso por Pallet',
            icon: Icon(Icons.line_weight),
          ),
        ),
      ],
    );
  }
}
