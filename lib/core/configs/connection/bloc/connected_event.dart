import 'package:flutter/material.dart';

@immutable
abstract class ConnectedEvent {}

class OnConnectedEvent extends ConnectedEvent {}

class OnNotConnectedEvents extends ConnectedEvent {}
