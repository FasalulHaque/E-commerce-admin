import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBlocBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  AuthenticationBlocBloc() : super(AuthenticationBlocInitial()) {
    on<AuthenticationBlocEvent>((event, emit) async {
      if (event is LoginEvent) {
        final auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        }
      }
    });
  }
}
