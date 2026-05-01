// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoachProfileStore on _CoachProfileStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_CoachProfileStore.isLoading',
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

  late final _$coachDetailsResponseAtom = Atom(
    name: '_CoachProfileStore.coachDetailsResponse',
    context: context,
  );

  @override
  BaseResponse<CoachDetailsResponse>? get coachDetailsResponse {
    _$coachDetailsResponseAtom.reportRead();
    return super.coachDetailsResponse;
  }

  @override
  set coachDetailsResponse(BaseResponse<CoachDetailsResponse>? value) {
    _$coachDetailsResponseAtom.reportWrite(
      value,
      super.coachDetailsResponse,
      () {
        super.coachDetailsResponse = value;
      },
    );
  }

  late final _$coachDetailsAtom = Atom(
    name: '_CoachProfileStore.coachDetails',
    context: context,
  );

  @override
  CoachDetailsResponse? get coachDetails {
    _$coachDetailsAtom.reportRead();
    return super.coachDetails;
  }

  @override
  set coachDetails(CoachDetailsResponse? value) {
    _$coachDetailsAtom.reportWrite(value, super.coachDetails, () {
      super.coachDetails = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_CoachProfileStore.errorMessage',
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

  late final _$numberOfPeopleAtom = Atom(
    name: '_CoachProfileStore.numberOfPeople',
    context: context,
  );

  @override
  int get numberOfPeople {
    _$numberOfPeopleAtom.reportRead();
    return super.numberOfPeople;
  }

  @override
  set numberOfPeople(int value) {
    _$numberOfPeopleAtom.reportWrite(value, super.numberOfPeople, () {
      super.numberOfPeople = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
coachDetailsResponse: ${coachDetailsResponse},
coachDetails: ${coachDetails},
errorMessage: ${errorMessage},
numberOfPeople: ${numberOfPeople}
    ''';
  }
}
