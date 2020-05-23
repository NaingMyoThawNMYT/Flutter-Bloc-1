import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc1/bloc/color/color_bloc.dart';
import 'package:flutterbloc1/bloc/color/color_event.dart';
import 'package:flutterbloc1/bloc/color/color_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (BuildContext context) => ColorBloc()),
        // add another blocs here...
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
