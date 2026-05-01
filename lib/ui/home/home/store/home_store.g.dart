// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_HomeStore.isLoading',
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

  late final _$coachDataResponseAtom = Atom(
    name: '_HomeStore.coachDataResponse',
    context: context,
  );

  @override
  BaseResponse<CoacheDataResponse>? get coachDataResponse {
    _$coachDataResponseAtom.reportRead();
    return super.coachDataResponse;
  }

  @override
  set coachDataResponse(BaseResponse<CoacheDataResponse>? value) {
    _$coachDataResponseAtom.reportWrite(value, super.coachDataResponse, () {
      super.coachDataResponse = value;
    });
  }

  late final _$filtersAtom = Atom(name: '_HomeStore.filters', context: context);

  @override
  Filters? get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(Filters? value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  late final _$topCoachesAtom = Atom(
    name: '_HomeStore.topCoaches',
    context: context,
  );

  @override
  List<Coach>? get topCoaches {
    _$topCoachesAtom.reportRead();
    return super.topCoaches;
  }

  @override
  set topCoaches(List<Coach>? value) {
    _$topCoachesAtom.reportWrite(value, super.topCoaches, () {
      super.topCoaches = value;
    });
  }

  late final _$otherCoachesAtom = Atom(
    name: '_HomeStore.otherCoaches',
    context: context,
  );

  @override
  List<Coach>? get otherCoaches {
    _$otherCoachesAtom.reportRead();
    return super.otherCoaches;
  }

  @override
  set otherCoaches(List<Coach>? value) {
    _$otherCoachesAtom.reportWrite(value, super.otherCoaches, () {
      super.otherCoaches = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_HomeStore.errorMessage',
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

  late final _$selectedSportAtom = Atom(
    name: '_HomeStore.selectedSport',
    context: context,
  );

  @override
  String get selectedSport {
    _$selectedSportAtom.reportRead();
    return super.selectedSport;
  }

  @override
  set selectedSport(String value) {
    _$selectedSportAtom.reportWrite(value, super.selectedSport, () {
      super.selectedSport = value;
    });
  }

  late final _$selectedGendersAtom = Atom(
    name: '_HomeStore.selectedGenders',
    context: context,
  );

  @override
  String get selectedGenders {
    _$selectedGendersAtom.reportRead();
    return super.selectedGenders;
  }

  @override
  set selectedGenders(String value) {
    _$selectedGendersAtom.reportWrite(value, super.selectedGenders, () {
      super.selectedGenders = value;
    });
  }

  late final _$selectedCoachingTypesAtom = Atom(
    name: '_HomeStore.selectedCoachingTypes',
    context: context,
  );

  @override
  String get selectedCoachingTypes {
    _$selectedCoachingTypesAtom.reportRead();
    return super.selectedCoachingTypes;
  }

  @override
  set selectedCoachingTypes(String value) {
    _$selectedCoachingTypesAtom.reportWrite(
      value,
      super.selectedCoachingTypes,
      () {
        super.selectedCoachingTypes = value;
      },
    );
  }

  late final _$selectedDistanceAtom = Atom(
    name: '_HomeStore.selectedDistance',
    context: context,
  );

  @override
  String get selectedDistance {
    _$selectedDistanceAtom.reportRead();
    return super.selectedDistance;
  }

  @override
  set selectedDistance(String value) {
    _$selectedDistanceAtom.reportWrite(value, super.selectedDistance, () {
      super.selectedDistance = value;
    });
  }

  late final _$selectedLanguageAtom = Atom(
    name: '_HomeStore.selectedLanguage',
    context: context,
  );

  @override
  String get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  late final _$isOpenAtom = Atom(name: '_HomeStore.isOpen', context: context);

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: '_HomeStore.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$fetchCoachesAsyncAction = AsyncAction(
    '_HomeStore.fetchCoaches',
    context: context,
  );

  @override
  Future<void> fetchCoaches() {
    return _$fetchCoachesAsyncAction.run(() => super.fetchCoaches());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
coachDataResponse: ${coachDataResponse},
filters: ${filters},
topCoaches: ${topCoaches},
otherCoaches: ${otherCoaches},
errorMessage: ${errorMessage},
selectedSport: ${selectedSport},
selectedGenders: ${selectedGenders},
selectedCoachingTypes: ${selectedCoachingTypes},
selectedDistance: ${selectedDistance},
selectedLanguage: ${selectedLanguage},
isOpen: ${isOpen},
currentPage: ${currentPage}
    ''';
  }
}
