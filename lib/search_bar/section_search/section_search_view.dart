import 'package:erp_fronted/branch/models/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'section_search_cubit.dart';
import 'section_search_state.dart';

class SectionSearchPage extends StatelessWidget {
  const SectionSearchPage({Key? key, required this.warehouseId})
      : super(key: key);
  final int warehouseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SectionSearchCubit()..getSections(warehouseId),
      child: Builder(builder: (context) => SectionSearch()),
    );
  }
}

class SectionSearch extends StatelessWidget {
  SectionSearch({Key? key}) : super(key: key);
  final TextEditingController _sectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionSearchCubit, SectionSearchState>(
      builder: (context, state) {
        return AlertDialog(
          title: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _sectionController,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: const StateViews(),
        );
      },
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionSearchCubit, SectionSearchState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: Text(
                  'Initial State',
                ),
              ),
            );
            break;
          case States.loading:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case States.loaded:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: SearchResult(),
            );
            break;
          case States.error:
            return SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: Text(
                  state.errorMessage,
                ),
              ),
            );
            break;
        }
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sections = context.watch<SectionSearchCubit>().state.sections;
    if (sections != null) {
      return ListView.builder(
        itemCount: sections.sections.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final Section section = sections.sections[index];
          return ListTile(
            title: Text(section.nameSection),
            onTap: () {
              Navigator.pop(context, section.id);
            },
          );
        },
      );
    }
    return Container();
  }
}
