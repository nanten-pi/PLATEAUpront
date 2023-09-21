import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainapp/viewmodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, builder) => ElevatedButton(
              onPressed: () {
                final viewModel = ref.read(viewModelProvider.notifier);
                viewModel.retrieveMessage();
              },
              child: const Text("get data"),
            ),
          ),
          const ExampleApp(),
        ],
      ),
    );
  }
}

class ExampleApp extends ConsumerWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Consumer(
        builder: (
          BuildContext context,
          ref,
          builder,
        ) {
          final viewModel = ref.watch(viewModelProvider);
          return viewModel.when(
            data: (data) {
              return Center(
                child: Text(
                  data.message,
                  style: const TextStyle(fontSize: 30),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => const Center(
              child: Text("oops"),
            ),
          );
        },
      ),
    );
  }
}
