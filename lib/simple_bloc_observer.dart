import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('BLoC Created: ${bloc.runtimeType}');
  }

  @override

  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event Dispatched: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('State Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('State Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Error Occurred: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('BLoC Closed: ${bloc.runtimeType}');
  }
}
