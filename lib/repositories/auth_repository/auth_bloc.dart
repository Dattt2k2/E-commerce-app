import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/bloc/auth/auth_event.dart';
import 'package:e_commerce_app/bloc/auth/auth_state.dart';
import 'package:e_commerce_app/repositories/auth_repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo  authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()){
    on<LoginEvent>(_onlogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onlogin(LoginEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try{
      final data = await authRepo.login(event.email, event.password);
      emit(Authenticated(token: data['token']));
    } catch(e){
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try{
      final data = await authRepo.register(event.email, event.password);
      emit(Authenticated(token: data['token']));
    } catch(e){
      emit(AuthFailure(message: e.toString()));
    }
  }

  void _onLogout(LogoutEvent event, Emitter<AuthState> emit){
    emit(Unautheticated());
  }
}