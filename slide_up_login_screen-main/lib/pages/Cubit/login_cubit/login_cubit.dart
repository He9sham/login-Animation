import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> Login_User(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailuer(errormessage: 'user not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailuer(errormessage: 'wrong password'));
      }
    } catch (e) {
      emit(LoginFailuer(errormessage: 'An error , please try agian later'));
    }
  }

  Future<void> Register_User(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        
        emit(LoginFailuer(errormessage: 'email already in use'));
      }
    } catch (e) {
      emit(LoginFailuer(errormessage: 'An error , please try agian later'));
    }
  }
}
