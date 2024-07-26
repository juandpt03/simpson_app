import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/characters/characters_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersState = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simpson App'),
      ),
      body: charactersState.map(
        success: (state) => ListView.builder(
          itemBuilder: (context, index) {
            final character = state.characters[index];
            return ListTile(
              leading: Text(character.id.toString()),
              title: Text(character.name),
              subtitle: Text(character.gender),
            );
          },
          itemCount: state.characters.length,
        ),
        loading: (_) => const Center(child: CircularProgressIndicator()),
        error: (state) => Center(
          child: Text(
            state.error.when(
              notInternet: () => 'No hay Internet',
              serverError: () => 'Error en el servidor',
              badRequest: () => 'Error en la petición',
              notFound: () => 'No se encontraron resultados',
              unknow: () => 'Error desconocido',
              unauthorized: () => 'No autorizado',
            ),
          ),
        ),
      ),
    );
  }
}
