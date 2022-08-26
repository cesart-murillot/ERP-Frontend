import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'product_add_bloc.dart';
import 'product_add_event.dart';
import 'product_add_state.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductAddBloc()..add(const InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Añadir Nuevo Producto'),
          ),
          body: ProductAdd(),
        ),
      ),
    );
  }
}

class ProductAdd extends StatelessWidget {
  ProductAdd({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _model = TextEditingController();
  final _format = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductAddBloc, ProductAddState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 512.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const ImagePickerForm(),
                      const SizedBox(
                        height: 8.0,
                        width: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 76.0,
                          child: TextFormField(
                            controller: _model,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Modelo'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ingrese el modelo";
                              }
                              return null;
                            },
                            onSaved: (model) {
                              if (model != null) {
                                context.read<ProductAddBloc>().add(StoreModelEvent(model));
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 76.0,
                          child: TextFormField(
                            controller: _format,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Formato'),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Seleccione un formato";
                              }
                              return null;
                            },
                            onSaved: (format) {
                              if (format != null) {
                                context.read<ProductAddBloc>().add(StoreFormatEvent(format));
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                                showDialog(
                                    context: context,
                                    builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<ProductAddBloc>(
                                          context),
                                      child: const ConfirmationDialog(),
                                    ),
                                );
                              }
                            },
                            child: const Text('Registrar'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Información General',
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: model,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Modelo del Producto',
              //icon: Icon(Icons.palette_rounded),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            key: _key,
            controller: format,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Formato',
              //icon: Icon(Icons.horizontal_rule),
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () {
              RenderBox box =
                  _key.currentContext?.findRenderObject() as RenderBox;
              Offset position =
                  box.localToGlobal(Offset.zero); //this is global position
              print(position);
              showDialog(
                context: context,
                builder: (_) => const CustomDialog(),
              );
            },
          )
        ],
      ),
    );
  }
}

class CustomDialog extends Dialog {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CustomScrollView(
        primary: false,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Text('$index');
              },
              childCount: 5,
            ),
          ),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: TextButton(
              onPressed: () {
                context.read<ProductAddBloc>().add(ShowAddInfoEvent(
                    false,
                    BlocProvider.of<ProductAddBloc>(context)
                        .state
                        .showTechnicalInformation));
              },
              child: const Text('Ocultar'),
            ),
            alignment: Alignment.centerRight,
          ),
          Text(
            'Información Adicional',
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: description,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Descripción',
              //icon: Icon(Icons.insert_drive_file),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: code,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Código',
              //icon: Icon(Icons.code),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: family,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Familia',
              //icon: Icon(Icons.widgets),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: finish,
            onSaved: (value) {},
            decoration: const InputDecoration(
                labelText: 'Acabado',
                //icon: Icon(Icons.fifteen_mp),
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: brand,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Marca',
              //icon: Icon(Icons.branding_watermark),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: origin,
            onSaved: (value) {},
            decoration: const InputDecoration(
                labelText: 'Origen',
                //icon: Icon(Icons.flag),
                border: OutlineInputBorder()),
          ),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.read<ProductAddBloc>().add(ShowAddInfoEvent(
                    BlocProvider.of<ProductAddBloc>(context, listen: false)
                        .state
                        .showAdditionalInformation,
                    false));
              },
              child: const Text('Ocultar'),
            ),
          ),
          Text(
            'Información Técnica',
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: unitMeasure,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Unidad de Medida',
              icon: Icon(Icons.compass_calibration),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: unitBox,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Unidades por Caja',
              icon: Icon(Icons.ad_units),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: areaBox,
            onSaved: (value) {},
            decoration: const InputDecoration(
              suffixText: 'm2.',
              labelText: 'Area de la Caja',
              icon: Icon(Icons.area_chart_sharp),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: boxesPallet,
            onSaved: (value) {},
            decoration: const InputDecoration(
              labelText: 'Cajas por Pallet',
              icon: Icon(Icons.all_inbox_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: areaPallet,
            onSaved: (value) {},
            decoration: const InputDecoration(
              suffixText: 'm2.',
              labelText: 'Area por Pallet',
              icon: Icon(Icons.area_chart),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: weightBox,
            onSaved: (value) {},
            decoration: const InputDecoration(
              suffixText: 'Kg.',
              labelText: 'Peso por Caja',
              icon: Icon(Icons.monitor_weight),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: weightPallet,
            onSaved: (value) {},
            decoration: const InputDecoration(
              suffixText: 'Kg.',
              labelText: 'Peso por Pallet',
              icon: Icon(Icons.line_weight),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerForm extends StatefulWidget {
  const ImagePickerForm({Key? key}) : super(key: key);

  @override
  State<ImagePickerForm> createState() => _ImagePickerFormState();
}

class _ImagePickerFormState extends State<ImagePickerForm> {
  //File? image;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 128.0,
          height: 128.0,
          child: image != null
              ? Image.network(
                  image!.path,
                  width: 128.0,
                  height: 128.0,
                  fit: BoxFit.scaleDown,
                )
              : const FlutterLogo(
                  size: 128.0,
                ),
        ),
        Wrap(
          children: [
            IconButton(
              onPressed: () {
                pickImage(BlocProvider.of<ProductAddBloc>(context));
              },
              icon: const Icon(Icons.camera),
            ),
            IconButton(
              onPressed: () {
                upLoadPhoto(BlocProvider.of<ProductAddBloc>(context));
              },
              icon: const Icon(Icons.upload_file),
            ),
            if (image != null)
              IconButton(
                onPressed: () {
                  removeImage();
                },
                icon: const Icon(Icons.delete),
              ),
          ],
        ),
      ],
    );
  }

  Future pickImage(ProductAddBloc productAddBloc) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imageTemporary = XFile(image.path);
      productAddBloc.add(UploadImageEvent(imageTemporary));
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print('Failed to pick image ${e.toString()}');
    }
  }

  Future upLoadPhoto(ProductAddBloc productAddBloc) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = XFile(image.path);
      productAddBloc.add(UploadImageEvent(imageTemporary));
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  void removeImage() {
    setState(() {
      image = null;
    });
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductAddBloc, ProductAddState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text(''),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<ProductAddBloc>().add(const SaveDataEvent());
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}