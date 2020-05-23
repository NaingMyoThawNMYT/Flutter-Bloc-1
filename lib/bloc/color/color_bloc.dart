import 'package:bloc/bloc.dart';
import 'package:flutterbloc1/bloc/color/color_event.dart';
import 'package:flutterbloc1/bloc/color/color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  @override
  ColorState get initialState => InitialColorState();

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event is ChangeColorEvent) {
      yield ChangeColorState(color: event.color);
    }
  }
}
