import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/kJobContainer.dart';
import 'package:jobapp/provider/features/search_state.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchState = Provider.of<SearchState>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          width: 200,
          child: Hero(
            tag: 'Search',
            child: TextFormField(
              onChanged: searchState.onSearchChanged,
              controller: searchState.searchController,
              focusNode: searchState.searchFocusNode,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (value) {
                searchState.fetchSearchResult();
              },
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: searchState.isLoading
          ? ListView.builder(
              itemCount: searchState.jobModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return KJobContainer(
                  title: searchState.jobModel!.data![index].jobTitle,
                  logo: searchState.jobModel!.data![index].userImage,
                  company: searchState.jobModel!.data![index].company,
                  salaryTitle:
                      searchState.jobModel!.data![index].estimatedSalary,
                );
              },
            )
          : searchState.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Center(
                    child: Text('Search Jobs'),
                  ),
                ),
    );
  }
}
