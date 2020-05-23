import 'package:flutter/material.dart';

abstract class ColorEvent {}

class ChangeColorEvent extends ColorEvent {
  final Color color;

  ChangeColorEvent({this.color});
}
