part of 'reward_video_bloc.dart';

@freezed
class RewardVideoState with _$RewardVideoState {
  const factory RewardVideoState.initial() = _Initial;
  const factory RewardVideoState.loading() = _Loading;
  const factory RewardVideoState.loaded(IronSourceAdInfo adInfo) = _Loaded;
  const factory RewardVideoState.error() = _Error;
}
