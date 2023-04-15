import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dog_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ));
  }
}

class MyHomePage extends ConsumerWidget{
  @override

  Widget build(BuildContext context, WidgetRef ref){
    final dogImageUrl = ref.watch(dogImageProvider) as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: dogImageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(dogImageProvider.notifier).fetchDogImage();
        },
        tooltip: 'New Dog Image',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
