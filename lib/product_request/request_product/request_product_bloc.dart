import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'request_product_event.dart';
import 'request_product_state.dart';

class RequestProductBloc
    extends Bloc<RequestProductEvent, RequestProductState> {
  final List<int> products = [];
  final List<int> quantity = [];

  RequestProductBloc() : super(const RequestProductState().init()) {
    on<InitEvent>(_init);
    on<StoreDataEvent>(_storeData);
    on<AddProductEvent>(_addProduct);
    on<AddQuantityEvent>(_addQuantity);
    on<SaveDataEvent>(_saveData);
    on<ClearDataEvent>(_clearData);
  }

  void _init(InitEvent event, Emitter<RequestProductState> emit) async {
    emit(const RequestProductState()
        .loadedInfo(state: RequestProductViewState.loading));

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');

    final url =
        preDefinedUri('/api/users/' + userId.toString(), {'with': 'all'});
    final User user = await getObject(url, User.serializer);

    await prefs.setInt('branchId', user.employee!.branchID!);
    final branchUrl = preDefinedUri('/api/branches/${user.employee?.branchID}');

    final Branch branch = await getObject(branchUrl, Branch.serializer);

    emit(const RequestProductState().loadedInfo(
        state: RequestProductViewState.loaded, user: user, branch: branch));
  }

  FutureOr<void> _storeData(
      StoreDataEvent event, Emitter<RequestProductState> emit) {
  }

  FutureOr<void> _addProduct(
      AddProductEvent event, Emitter<RequestProductState> emit) {
    products.add(event.productId);
  }

  FutureOr<void> _addQuantity(
      AddQuantityEvent event, Emitter<RequestProductState> emit) {
    quantity.add(event.quantity);
  }

  FutureOr<void> _saveData(
      SaveDataEvent event, Emitter<RequestProductState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final branchId = prefs.getInt('branchId');

    final transfer = Transfer((transfer) {
      transfer.branchId = branchId;
      transfer.userId = userId;

      for (int i = 0; i < products.length; i++) {
        final productTransfer = ProductTransfer((productTransfer) {
          productTransfer.productId = products[i];
          productTransfer.quantity = quantity[i];
        });
        transfer.productTransfers.add(productTransfer);
      }
    });

    final transferString = objectToString(transfer, Transfer.serializer);
    final url = preDefinedUri('api/transfers/');

    try {
      final String response = await postDataToApi(url, transferString!);

    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> _clearData(
      ClearDataEvent event, Emitter<RequestProductState> emit) {
    products.clear();
    quantity.clear();
  }
}
