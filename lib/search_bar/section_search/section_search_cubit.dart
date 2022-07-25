import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/section_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'section_search_state.dart';

class SectionSearchCubit extends Cubit<SectionSearchState> {
  SectionSearchCubit() : super(const SectionSearchState().init());

  Future<void> getSections(int warehouseId) async {
    emit(state.clone(state: States.loading));
    final url = preDefinedUri('/api/sections', {'warehouse': '$warehouseId'});

    try {
      final Sections sections = await getObject(url, Sections.serializer);
      emit(state.clone(state: States.loaded, sections: sections));
    } catch (e) {
      print(e);
    }
  }
}
