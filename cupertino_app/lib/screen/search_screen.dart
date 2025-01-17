import 'package:flutter/cupertino.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Search screen'),
      ),
      child: Center(
        child: Text(
          'Search Screen',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
