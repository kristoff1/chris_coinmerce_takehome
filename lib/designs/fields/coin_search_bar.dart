import 'dart:async';

import 'package:flutter/material.dart';

class CoinSearchBar extends StatefulWidget {
  final Function(String) onQueryIssued;

  const CoinSearchBar({
    super.key,
    required this.onQueryIssued,
  });

  @override
  State<CoinSearchBar> createState() => _CoinSearchBarState();
}

class _CoinSearchBarState extends State<CoinSearchBar> {
  final TextEditingController _searchBarController = TextEditingController();
  Timer? _debounceTimer;
  bool isFocus = false;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: _onFocusChange,
      child: TextField(
        controller: _searchBarController,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          hintText: 'Search for a coin',
          suffixIcon: _getSearchSuffix(isFocus),
        ),
        onChanged: _onQueryFixed,
      ),
    );
  }

  ///Adjustable Searchbar suffix icon
  Widget _getSearchSuffix(bool isFocus) {
    if (isFocus) {
      return IconButton(
        onPressed: () {
          _searchBarController.text = '';
          FocusManager.instance.primaryFocus?.unfocus();
        },
        icon: const Icon(Icons.clear),
      );
    }
    return const Icon(Icons.search);
  }

  void _onFocusChange(bool isFocus) {
    setState(() {
      this.isFocus = isFocus;
    });
  }

  ///Debounce the search query
  ///500ms of interaction absence will trigger the search
  void _onQueryFixed(String value) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onQueryIssued(value);
    });
  }
}
