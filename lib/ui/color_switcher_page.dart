import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc1/bloc/color/bloc.dart';

class ColorSwitcherPage extends StatelessWidget {
  ColorSwitcherPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<ColorBloc, ColorState>(
                condition: (previousState, currentState) {
                  // "builder" will only work when this method return true
                  // so you can add condition here
                  if (previousState is ChangeColorState &&
                      currentState is ChangeColorState) {
                    // if same state and same value
                    // then we don't need to update UI
                    return previousState.color != currentState.color;
                  }
                  // if state changed then update UI
                  return previousState != currentState;
                },
                builder: (context, state) {
                  if (state is ChangeColorState) {
                    return Container(color: state.color);
                  } else {
                    return Container(color: Colors.transparent);
                  }
                },
              ),
            ),
            // BlocListener should be used for functionality
            // that needs to occur only in response to a state change
            // such as navigation, showing a SnackBar,
            // showing a Dialog, etc...
            BlocListener<ColorBloc, ColorState>(
              condition: (previousState, currentState) {
                // "listener" will only work when this method return true
                // so you can add condition here
                if (previousState is ChangeColorState &&
                    currentState is ChangeColorState) {
                  // if same state and same value
                  // then we don't need to update UI
                  return previousState.color != currentState.color;
                }
                // if state changed then update UI
                return previousState != currentState;
              },
              listener: (context, state) {
                if (state is ChangeColorState) {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Color is changed'),
                      ),
                    );
                }
                // else...
              },
              child: Container(),
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
