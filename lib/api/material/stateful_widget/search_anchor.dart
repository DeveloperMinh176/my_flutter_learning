import 'package:flutter/material.dart';

final mySearchAnchor = SearchAnchor(
    searchController: SearchController(),
    builder: (context, controller) {
      return SearchBar(
        controller: controller,
        padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
        onChanged: (value) {
          controller.openView();
        },
        leading: null,
        trailing: null,
        onTap: () => controller.openView(),
      );
    },
    suggestionsBuilder: (context, controller) => []);
