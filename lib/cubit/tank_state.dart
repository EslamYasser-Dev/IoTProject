part of 'tank_cubit.dart';

@immutable
abstract class TankState {}

class TankInitial extends TankState {}

class TankLoaded extends TankState{
  final List<Tank> tanks;
  TankLoaded(this.tanks);
}

class TankAlert extends TankState{
  
}