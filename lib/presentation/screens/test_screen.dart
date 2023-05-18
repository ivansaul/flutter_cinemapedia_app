import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/providers/moviedb_provider.dart';

class TestScren extends ConsumerStatefulWidget {
  const TestScren({Key? key}) : super(key: key);

  @override
  TestScrenState createState() => TestScrenState();
}

class TestScrenState extends ConsumerState<TestScren> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(nowPlayingMoviesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi AppBar'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.backdropPath),
              ),
            ),
            child: Center(
              child: Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
