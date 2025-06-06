import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restapi/data/model/request/buyer/buyer_profile_request_model.dart';
import 'package:restapi/data/model/response/buyer/buyer_profile_reponse_model.dart';
import 'package:restapi/data/repository/profile_buyer_repository.dart';

part 'profile_buyer_event.dart';
part 'profile_buyer_state.dart';

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  final ProfileBuyerRepository profileBuyerRepository;

  ProfileBuyerBloc({required this.profileBuyerRepository})
      : super(ProfileBuyerInitial()) {
    on<AddProfileBuyerEvent>(_addProfileBuyer);
    on<GetProfileBuyerEvent>(_getProfileBuyer);
  }

  Future<void> _addProfileBuyer(
      AddProfileBuyerEvent event,
      Emitter<ProfileBuyerState> emit) async {
    emit(ProfileBuyerLoading());

    final result = await profileBuyerRepository.addProfileBuyer(event.requestModel);

    result.fold(
      (error) => emit(ProfileBuyerAddError(message: error)),
      (profile) => emit(ProfileBuyerAdded(profile: profile)),
    );
  }

  Future<void> _getProfileBuyer(
      GetProfileBuyerEvent event,
      Emitter<ProfileBuyerState> emit) async {
    emit(ProfileBuyerLoading());

    final result = await profileBuyerRepository.getProfileBuyer();

    result.fold(
      (error) => emit(ProfileBuyerError(message: error)),
      (profile) => emit(ProfileBuyerLoaded(profile: profile)),
    );
  }
}

