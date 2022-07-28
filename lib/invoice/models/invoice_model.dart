import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';

part 'invoice_model.g.dart';

abstract class Invoices implements Built<Invoices, InvoicesBuilder> {
  static Serializer<Invoices> get serializer => _$invoicesSerializer;

  BuiltList<Invoice> get invoices;

  Invoices._();
  factory Invoices([void Function(InvoicesBuilder) updates]) = _$Invoices;
}

abstract class Invoice implements Built<Invoice, InvoiceBuilder> {
  static Serializer<Invoice> get serializer => _$invoiceSerializer;

  int get id;

  @BuiltValueField(wireName: 'company_name')
  String get companyName;

  @BuiltValueField(wireName: 'type_branch')
  String get typeBranch;

  String get address;

  String get city;

  @BuiltValueField(wireName: 'nit_company')
  String get nitCompany;

  @BuiltValueField(wireName: 'number_invoice')
  int get numberInvoice;

  @BuiltValueField(wireName: 'auth_code')
  String get authCode;

  @BuiltValueField(wireName: 'company_name')
  String get date;

  @BuiltValueField(wireName: 'nit_client')
  String get nitClient;

  String get client;

  double get total;

  @BuiltValueField(wireName: 'fc_base')
  double get fcBase;

  String get literal;

  String get quote;

  @BuiltValueField(wireName: 'sale_id')
  int get saleId;

  Sale get sale;

  Invoice._();
  factory Invoice([void Function(InvoiceBuilder) updates]) = _$Invoice;
}