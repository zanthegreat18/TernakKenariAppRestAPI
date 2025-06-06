import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restapi/data/model/request/auth/login_request_model.dart';
import 'package:restapi/data/model/response/auth_reponse_model.dart';
import 'package:restapi/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }
  
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    
    final result = await authRepository.login(event.requestModel);
    
    result.fold(
      (l) => emit(LoginFailure(error: l)),
      (r) => emit(LoginSuccess(responseModel: r)),
    );
  }
}
