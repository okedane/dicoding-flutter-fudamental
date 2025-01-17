import 'package:cupertino_app/static/my_route.dart';
import 'package:flutter/cupertino.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Feeds screen'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Screen',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            const SizedBox.square(dimension: 8),
            CupertinoButton.filled(
              child: const Text("Select Category"),
              onPressed: () {
                _openDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('Select Category'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Business');
              },
              child: const Text('Business'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Entertainment');
              },
              child: const Text('Entertainment'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'General');
              },
              child: const Text('General'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Health');
              },
              child: const Text('Health'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Science');
              },
              child: const Text('Science'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Sports');
              },
              child: const Text('Sports'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pushNamed(context, MyRoute.category.name,
                    arguments: 'Technology');
              },
              child: const Text('Technology'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
