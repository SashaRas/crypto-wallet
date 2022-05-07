import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'getcurrency_event.dart';
part 'getcurrency_state.dart';

class GetcurrencyBloc extends Bloc<GetcurrencyEvent, GetcurrencyState> {
  GetcurrencyBloc() : super(GetcurrencyInitial());

  @override
  Stream<GetcurrencyState> mapEventToState(
    GetcurrencyEvent event,
  ) async* {
    try {
      if(event is ClickAddButton){
        yield GetcurrencyDone(event.cryptoName);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
