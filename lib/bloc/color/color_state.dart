import 'package:flutter/material.dart';

abstract class ColorState {}

class InitialColorState extends ColorState {}

class ChangeColorState extends ColorState {
  final Color color;

  ChangeColorState({this.color});
}
