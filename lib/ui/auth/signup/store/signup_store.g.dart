// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on _SignupStore, Store {
  late final _$countryCodeAtom = Atom(
    name: '_SignupStore.countryCode',
    context: context,
  );

  @override
  String get countryCode {
    _$countryCodeAtom.reportRead();
    return super.countryCode;
  }

  @override
  set countryCode(String value) {
    _$countryCodeAtom.reportWrite(value, super.countryCode, () {
      super.countryCode = value;
    });
  }

  late final _$visiblePasswordAtom = Atom(
    name: '_SignupStore.visiblePassword',
    context: context,
  );

  @override
  bool get visiblePassword {
    _$visiblePasswordAtom.reportRead();
    return super.visiblePassword;
  }

  @override
  set visiblePassword(bool value) {
    _$visiblePasswordAtom.reportWrite(value, super.visiblePassword, () {
      super.visiblePassword = value;
    });
  }

  late final _$signupResponseAtom = Atom(
    name: '_SignupStore.signupResponse',
    context: context,
  );

  @override
  BaseResponse<SignupResponse>? get signupResponse {
    _$signupResponseAtom.reportRead();
    return super.signupResponse;
  }

  @override
  set signupResponse(BaseResponse<SignupResponse>? value) {
    _$signupResponseAtom.reportWrite(value, super.signupResponse, () {
      super.signupResponse = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_SignupStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_SignupStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$confirmVisiblePasswordAtom = Atom(
    name: '_SignupStore.confirmVisiblePassword',
    context: context,
  );

  @override
  bool get confirmVisiblePassword {
    _$confirmVisiblePasswordAtom.reportRead();
    return super.confirmVisiblePassword;
  }

  @override
  set confirmVisiblePassword(bool value) {
    _$confirmVisiblePasswordAtom.reportWrite(
      value,
      super.confirmVisiblePassword,
      () {
        super.confirmVisiblePassword = value;
      },
    );
  }

  late final _$checkBoxValueAtom = Atom(
    name: '_SignupStore.checkBoxValue',
    context: context,
  );

  @override
  bool? get checkBoxValue {
    _$checkBoxValueAtom.reportRead();
    return super.checkBoxValue;
  }

  @override
  set checkBoxValue(bool? value) {
    _$checkBoxValueAtom.reportWrite(value, super.checkBoxValue, () {
      super.checkBoxValue = value;
    });
  }

  late final _$signUpAsyncAction = AsyncAction(
    '_SignupStore.signUp',
    context: context,
  );

  @override
  Future<void> signUp(SignupRequest request) {
    return _$signUpAsyncAction.run(() => super.signUp(request));
  }

  late final _$_SignupStoreActionController = ActionController(
    name: '_SignupStore',
    context: context,
  );

  @override
  void setCountryCode(String? value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
      name: '_SignupStore.setCountryCode',
    );
    try {
      return super.setCountryCode(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countryCode: ${countryCode},
visiblePassword: ${visiblePassword},
signupResponse: ${signupResponse},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
confirmVisiblePassword: ${confirmVisiblePassword},
checkBoxValue: ${checkBoxValue}
    ''';
  }
}
