import 'package:alvic_test/components/characters/presentation/bloc/characters_bloc.dart';
import 'package:alvic_test/components/characters/presentation/views/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(const CharactersState()),
       child: const CharactersView(),
    );
  }
}