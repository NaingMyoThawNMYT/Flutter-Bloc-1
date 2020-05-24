import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc1/bloc/color/bloc.dart';

class ColorSwitcherPage extends StatefulWidget {
  ColorSwitcherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ColorSwitcherPageState createState() => _ColorSwitcherPageState();
}

class _ColorSwitcherPageState extends State<ColorSwitcherPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<ColorBloc, ColorState>(
                builder: (context, state) {
                  return Container(
                    color: (state is ChangeColorState)
                        ? state.color
                        : Colors.black,
                  );
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      colorBloc.add(ChangeColorEvent(color: Colors.yellow));
                    },
                    color: Colors.yellow,
                    child: Text('Yellow'),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      colorBloc.add(ChangeColorEvent(color: Colors.green));
                    },
                    color: Colors.green,
                    child: Text('Green'),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      colorBloc.add(ChangeColorEvent(color: Colors.red));
                    },
                    color: Colors.red,
                    child: Text('Red'),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      colorBloc.add(ChangeColorEvent(color: Colors.blue));
                    },
                    color: Colors.blue,
                    child: Text('Blue'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
