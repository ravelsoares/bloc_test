import 'package:bloc_pratic/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pratic'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Excluído Com Sucesso')));
        },
        listenWhen: (previous, current) {
          if (previous is HomeStateInitial) return false;
          return (previous as HomeStateDataLoaded).names.length >
              (current as HomeStateDataLoaded).names.length;
        },
        builder: (context, state) {
          if (state is HomeStateDataLoaded) {
            return ListView.builder(
              itemCount: state.names.length,
              itemBuilder: (context, index) {
                final name = state.names[index];
                return ListTile(
                  onTap: () {
                    context.read<HomeBloc>().add(HomeEventRemove(index: index));
                  },
                  title: Text(name),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeBloc>().add(HomeEventAdd(name: 'teste'));
        },
      ),
    );
  }
}
