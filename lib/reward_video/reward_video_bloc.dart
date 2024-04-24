import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_video_event.dart';
part 'reward_video_state.dart';
part 'reward_video_bloc.freezed.dart';

class RewardVideoBloc extends Bloc<RewardVideoEvent, RewardVideoState> {
  RewardVideoBloc() : super(const RewardVideoState.initial()) {
    on<RewardVideoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
