
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "characters_event.dart";
part "characters_state.dart";

class CharactersBloc
    extends Bloc<CharactersEvent, CharactersState> {

  CharactersBloc(super.initialState); // Implements Character State, Event
}