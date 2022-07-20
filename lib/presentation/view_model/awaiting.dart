import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AwaitingCubit extends Cubit<WaitingState> {
  AwaitingCubit([super.initialState = WaitingState.processing]);
}

enum WaitingState {
  processing,
  ready,
}
