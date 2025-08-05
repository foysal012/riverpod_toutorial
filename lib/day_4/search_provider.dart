import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState>{
  SearchNotifier() : super(SearchState(searchValue: '', isSearched: false));

  void searchText({required String query}){
    state = state.copyWith(searchValue: query);
  }

  void onChange({required bool onChange}){
    state = state.copyWith(isSearched: onChange);
  }
}

class SearchState {
  final String searchValue;
  final bool isSearched;

  SearchState({required this.searchValue, required this.isSearched});

  SearchState copyWith({String? searchValue, bool? isSearched}){
    return SearchState(
        searchValue: searchValue?? this.searchValue,
        isSearched: isSearched?? this.isSearched
    );
  }
}