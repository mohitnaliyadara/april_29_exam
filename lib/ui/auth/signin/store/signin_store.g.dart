// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on _SigninStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_SigninStore.isLoading',
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
    name: '_SigninStore.errorMessage',
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

  late final _$visiblePasswordAtom = Atom(
    name: '_SigninStore.visiblePassword',
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

  late final _$signInResponseAtom = Atom(
    name: '_SigninStore.signInResponse',
    context: context,
  );

  @override
  BaseResponse<SignInResponse>? get signInResponse {
    _$signInResponseAtom.reportRead();
    return super.signInResponse;
  }

  @override
  set signInResponse(BaseResponse<SignInResponse>? value) {
    _$signInResponseAtom.reportWrite(value, super.signInResponse, () {
      super.signInResponse = value;
    });
  }

  late final _$signInAsyncAction = AsyncAction(
    '_SigninStore.signIn',
    context: context,
  );

  @override
  Future<void> signIn(SignInRequest request) {
    return _$signInAsyncAction.run(() => super.signIn(request));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
visiblePassword: ${visiblePassword},
signInResponse: ${signInResponse}
    ''';
  }
}
