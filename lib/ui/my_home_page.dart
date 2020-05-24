import 'package:flutter/material.dart';
import 'package:flutterbloc1/ui/color_switcher_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ColorSwitcherPage(title: 'Color Switcher Page')),
                  );
                },
                child: Text('Color Switcher Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
