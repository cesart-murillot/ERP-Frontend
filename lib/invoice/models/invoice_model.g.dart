// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Invoices> _$invoicesSerializer = new _$InvoicesSerializer();
Serializer<Invoice> _$invoiceSerializer = new _$InvoiceSerializer();

class _$InvoicesSerializer implements StructuredSerializer<Invoices> {
  @override
  final Iterable<Type> types = const [Invoices, _$Invoices];
  @override
  final String wireName = 'Invoices';

  @override
  Iterable<Object?> serialize(Serializers serializers, Invoices object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'invoices',
      serializers.serialize(object.invoices,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Invoice)])),
    ];

    return result;
  }

  @override
  Invoices deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoicesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'invoices':
          result.invoices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Invoice)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$InvoiceSerializer implements StructuredSerializer<Invoice> {
  @override
  final Iterable<Type> types = const [Invoice, _$Invoice];
  @override
  final String wireName = 'Invoice';

  @override
  Iterable<Object?> serialize(Serializers serializers, Invoice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'company_name',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
      'type_branch',
      serializers.serialize(object.typeBranch,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'nit_company',
      serializers.serialize(object.nitCompany,
          specifiedType: const FullType(String)),
      'number_invoice',
      serializers.serialize(object.numberInvoice,
          specifiedType: const FullType(int)),
      'auth_code',
      serializers.serialize(object.authCode,
          specifiedType: const FullType(String)),
      'company_name',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'nit_client',
      serializers.serialize(object.nitClient,
          specifiedType: const FullType(String)),
      'client',
      serializers.serialize(object.client,
          specifiedType: const FullType(String)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(double)),
      'fc_base',
      serializers.serialize(object.fcBase,
          specifiedType: const FullType(double)),
      'literal',
      serializers.serialize(object.literal,
          specifiedType: const FullType(String)),
      'quote',
      serializers.serialize(object.quote,
          specifiedType: const FullType(String)),
      'sale_id',
      serializers.serialize(object.saleId, specifiedType: const FullType(int)),
      'sale',
      serializers.serialize(object.sale, specifiedType: const FullType(Sale)),
    ];

    return result;
  }

  @override
  Invoice deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type_branch':
          result.typeBranch = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nit_company':
          result.nitCompany = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'number_invoice':
          result.numberInvoice = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'auth_code':
          result.authCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'company_name':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nit_client':
          result.nitClient = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'client':
          result.client = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'fc_base':
          result.fcBase = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'literal':
          result.literal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'quote':
          result.quote = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sale_id':
          result.saleId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sale':
          result.sale.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sale))! as Sale);
          break;
      }
    }

    return result.build();
  }
}

class _$Invoices extends Invoices {
  @override
  final BuiltList<Invoice> invoices;

  factory _$Invoices([void Function(InvoicesBuilder)? updates]) =>
      (new InvoicesBuilder()..update(updates))._build();

  _$Invoices._({required this.invoices}) : super._() {
    BuiltValueNullFieldError.checkNotNull(invoices, 'Invoices', 'invoices');
  }

  @override
  Invoices rebuild(void Function(InvoicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoicesBuilder toBuilder() => new InvoicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Invoices && invoices == other.invoices;
  }

  @override
  int get hashCode {
    return $jf($jc(0, invoices.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Invoices')..add('invoices', invoices))
        .toString();
  }
}

class InvoicesBuilder implements Builder<Invoices, InvoicesBuilder> {
  _$Invoices? _$v;

  ListBuilder<Invoice>? _invoices;
  ListBuilder<Invoice> get invoices =>
      _$this._invoices ??= new ListBuilder<Invoice>();
  set invoices(ListBuilder<Invoice>? invoices) => _$this._invoices = invoices;

  InvoicesBuilder();

  InvoicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _invoices = $v.invoices.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Invoices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Invoices;
  }

  @override
  void update(void Function(InvoicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Invoices build() => _build();

  _$Invoices _build() {
    _$Invoices _$result;
    try {
      _$result = _$v ?? new _$Invoices._(invoices: invoices.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'invoices';
        invoices.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Invoices', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Invoice extends Invoice {
  @override
  final int id;
  @override
  final String companyName;
  @override
  final String typeBranch;
  @override
  final String address;
  @override
  final String city;
  @override
  final String nitCompany;
  @override
  final int numberInvoice;
  @override
  final String authCode;
  @override
  final String date;
  @override
  final String nitClient;
  @override
  final String client;
  @override
  final double total;
  @override
  final double fcBase;
  @override
  final String literal;
  @override
  final String quote;
  @override
  final int saleId;
  @override
  final Sale sale;

  factory _$Invoice([void Function(InvoiceBuilder)? updates]) =>
      (new InvoiceBuilder()..update(updates))._build();

  _$Invoice._(
      {required this.id,
      required this.companyName,
      required this.typeBranch,
      required this.address,
      required this.city,
      required this.nitCompany,
      required this.numberInvoice,
      required this.authCode,
      required this.date,
      required this.nitClient,
      required this.client,
      required this.total,
      required this.fcBase,
      required this.literal,
      required this.quote,
      required this.saleId,
      required this.sale})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Invoice', 'id');
    BuiltValueNullFieldError.checkNotNull(
        companyName, 'Invoice', 'companyName');
    BuiltValueNullFieldError.checkNotNull(typeBranch, 'Invoice', 'typeBranch');
    BuiltValueNullFieldError.checkNotNull(address, 'Invoice', 'address');
    BuiltValueNullFieldError.checkNotNull(city, 'Invoice', 'city');
    BuiltValueNullFieldError.checkNotNull(nitCompany, 'Invoice', 'nitCompany');
    BuiltValueNullFieldError.checkNotNull(
        numberInvoice, 'Invoice', 'numberInvoice');
    BuiltValueNullFieldError.checkNotNull(authCode, 'Invoice', 'authCode');
    BuiltValueNullFieldError.checkNotNull(date, 'Invoice', 'date');
    BuiltValueNullFieldError.checkNotNull(nitClient, 'Invoice', 'nitClient');
    BuiltValueNullFieldError.checkNotNull(client, 'Invoice', 'client');
    BuiltValueNullFieldError.checkNotNull(total, 'Invoice', 'total');
    BuiltValueNullFieldError.checkNotNull(fcBase, 'Invoice', 'fcBase');
    BuiltValueNullFieldError.checkNotNull(literal, 'Invoice', 'literal');
    BuiltValueNullFieldError.checkNotNull(quote, 'Invoice', 'quote');
    BuiltValueNullFieldError.checkNotNull(saleId, 'Invoice', 'saleId');
    BuiltValueNullFieldError.checkNotNull(sale, 'Invoice', 'sale');
  }

  @override
  Invoice rebuild(void Function(InvoiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceBuilder toBuilder() => new InvoiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Invoice &&
        id == other.id &&
        companyName == other.companyName &&
        typeBranch == other.typeBranch &&
        address == other.address &&
        city == other.city &&
        nitCompany == other.nitCompany &&
        numberInvoice == other.numberInvoice &&
        authCode == other.authCode &&
        date == other.date &&
        nitClient == other.nitClient &&
        client == other.client &&
        total == other.total &&
        fcBase == other.fcBase &&
        literal == other.literal &&
        quote == other.quote &&
        saleId == other.saleId &&
        sale == other.sale;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        id
                                                                            .hashCode),
                                                                    companyName
                                                                        .hashCode),
                                                                typeBranch
                                                                    .hashCode),
                                                            address.hashCode),
                                                        city.hashCode),
                                                    nitCompany.hashCode),
                                                numberInvoice.hashCode),
                                            authCode.hashCode),
                                        date.hashCode),
                                    nitClient.hashCode),
                                client.hashCode),
                            total.hashCode),
                        fcBase.hashCode),
                    literal.hashCode),
                quote.hashCode),
            saleId.hashCode),
        sale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Invoice')
          ..add('id', id)
          ..add('companyName', companyName)
          ..add('typeBranch', typeBranch)
          ..add('address', address)
          ..add('city', city)
          ..add('nitCompany', nitCompany)
          ..add('numberInvoice', numberInvoice)
          ..add('authCode', authCode)
          ..add('date', date)
          ..add('nitClient', nitClient)
          ..add('client', client)
          ..add('total', total)
          ..add('fcBase', fcBase)
          ..add('literal', literal)
          ..add('quote', quote)
          ..add('saleId', saleId)
          ..add('sale', sale))
        .toString();
  }
}

class InvoiceBuilder implements Builder<Invoice, InvoiceBuilder> {
  _$Invoice? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _typeBranch;
  String? get typeBranch => _$this._typeBranch;
  set typeBranch(String? typeBranch) => _$this._typeBranch = typeBranch;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _nitCompany;
  String? get nitCompany => _$this._nitCompany;
  set nitCompany(String? nitCompany) => _$this._nitCompany = nitCompany;

  int? _numberInvoice;
  int? get numberInvoice => _$this._numberInvoice;
  set numberInvoice(int? numberInvoice) =>
      _$this._numberInvoice = numberInvoice;

  String? _authCode;
  String? get authCode => _$this._authCode;
  set authCode(String? authCode) => _$this._authCode = authCode;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _nitClient;
  String? get nitClient => _$this._nitClient;
  set nitClient(String? nitClient) => _$this._nitClient = nitClient;

  String? _client;
  String? get client => _$this._client;
  set client(String? client) => _$this._client = client;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  double? _fcBase;
  double? get fcBase => _$this._fcBase;
  set fcBase(double? fcBase) => _$this._fcBase = fcBase;

  String? _literal;
  String? get literal => _$this._literal;
  set literal(String? literal) => _$this._literal = literal;

  String? _quote;
  String? get quote => _$this._quote;
  set quote(String? quote) => _$this._quote = quote;

  int? _saleId;
  int? get saleId => _$this._saleId;
  set saleId(int? saleId) => _$this._saleId = saleId;

  SaleBuilder? _sale;
  SaleBuilder get sale => _$this._sale ??= new SaleBuilder();
  set sale(SaleBuilder? sale) => _$this._sale = sale;

  InvoiceBuilder();

  InvoiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _companyName = $v.companyName;
      _typeBranch = $v.typeBranch;
      _address = $v.address;
      _city = $v.city;
      _nitCompany = $v.nitCompany;
      _numberInvoice = $v.numberInvoice;
      _authCode = $v.authCode;
      _date = $v.date;
      _nitClient = $v.nitClient;
      _client = $v.client;
      _total = $v.total;
      _fcBase = $v.fcBase;
      _literal = $v.literal;
      _quote = $v.quote;
      _saleId = $v.saleId;
      _sale = $v.sale.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Invoice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Invoice;
  }

  @override
  void update(void Function(InvoiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Invoice build() => _build();

  _$Invoice _build() {
    _$Invoice _$result;
    try {
      _$result = _$v ??
          new _$Invoice._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Invoice', 'id'),
              companyName: BuiltValueNullFieldError.checkNotNull(
                  companyName, 'Invoice', 'companyName'),
              typeBranch: BuiltValueNullFieldError.checkNotNull(
                  typeBranch, 'Invoice', 'typeBranch'),
              address: BuiltValueNullFieldError.checkNotNull(
                  address, 'Invoice', 'address'),
              city: BuiltValueNullFieldError.checkNotNull(
                  city, 'Invoice', 'city'),
              nitCompany: BuiltValueNullFieldError.checkNotNull(
                  nitCompany, 'Invoice', 'nitCompany'),
              numberInvoice: BuiltValueNullFieldError.checkNotNull(
                  numberInvoice, 'Invoice', 'numberInvoice'),
              authCode: BuiltValueNullFieldError.checkNotNull(
                  authCode, 'Invoice', 'authCode'),
              date: BuiltValueNullFieldError.checkNotNull(
                  date, 'Invoice', 'date'),
              nitClient: BuiltValueNullFieldError.checkNotNull(
                  nitClient, 'Invoice', 'nitClient'),
              client: BuiltValueNullFieldError.checkNotNull(
                  client, 'Invoice', 'client'),
              total: BuiltValueNullFieldError.checkNotNull(total, 'Invoice', 'total'),
              fcBase: BuiltValueNullFieldError.checkNotNull(fcBase, 'Invoice', 'fcBase'),
              literal: BuiltValueNullFieldError.checkNotNull(literal, 'Invoice', 'literal'),
              quote: BuiltValueNullFieldError.checkNotNull(quote, 'Invoice', 'quote'),
              saleId: BuiltValueNullFieldError.checkNotNull(saleId, 'Invoice', 'saleId'),
              sale: sale.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sale';
        sale.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Invoice', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
