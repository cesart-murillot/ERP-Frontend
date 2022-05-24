import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_form_field_cubit.dart';

class CustomFormFieldPage extends StatelessWidget {
  CustomFormFieldPage({
    Key? key,
    required this.labelText,
    //required this.textEditingController,
    required this.onSavedCallback,
    //required this.onSaved,
  }) : super(key: key);
  final String labelText;
  final Function(TextEditingController) onSavedCallback;
  final TextEditingController _textEditingController = TextEditingController();

  //final VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CustomFormFieldCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<CustomFormFieldCubit>(context);
    return TextFormField(
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onSaved: (value) {
        _textEditingController.text = value!;
        onSavedCallback(_textEditingController);
      },
      //onChanged: (value) => onSavedCallback(value, context),
    );
  }
}
