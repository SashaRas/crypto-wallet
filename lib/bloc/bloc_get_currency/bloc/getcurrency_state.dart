part of 'getcurrency_bloc.dart';

@immutable
abstract class GetcurrencyState {}

class GetcurrencyInitial extends GetcurrencyState {
  // final cryptoName;
  // GetcurrencyInitial(this.cryptoName);
}

class GetcurrencyDone extends GetcurrencyState{
  final cryptoName;
  GetcurrencyDone(this.cryptoName);
}
