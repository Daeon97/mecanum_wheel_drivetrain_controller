// ignore_for_file: public_member_api_docs

part of 'screen_to_show_cubit.dart';

abstract class ScreenToShowState extends Equatable {
  const ScreenToShowState();

  @override
  List<Object?> get props => [];
}

class ScreenToShowInitialState extends ScreenToShowState {
  const ScreenToShowInitialState();

  @override
  List<Object?> get props => [];
}

class ShowScreenState extends ScreenToShowState {
  const ShowScreenState(
    this.screenToShow,
  );

  final ScreenToShow screenToShow;

  @override
  List<Object?> get props => [];
}
