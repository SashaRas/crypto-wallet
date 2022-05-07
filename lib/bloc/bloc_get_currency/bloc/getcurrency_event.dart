part of 'getcurrency_bloc.dart';

@immutable
abstract class GetcurrencyEvent {}

class ClickAddButton extends GetcurrencyEvent{
  final cryptoName;
  ClickAddButton(this.cryptoName);
}