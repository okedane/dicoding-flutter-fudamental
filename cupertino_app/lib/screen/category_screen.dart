import 'package:flutter/cupertino.dart';

class CategoryScreen extends StatelessWidget {
  final String selecedCategory;
  const CategoryScreen({
    super.key,
    required this.selecedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Category screen'),
      ),
      child: Center(
        child: Text(
          '$selecedCategory Screen',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
