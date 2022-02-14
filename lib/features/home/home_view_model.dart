import 'package:flutter/cupertino.dart';
import 'package:provider_example/enums/load_state_enum.dart';
import 'package:provider_example/features/home/joke_model.dart';
import 'package:provider_example/services/joke_service.dart';

class HomeViewModel extends ChangeNotifier {
  LoadState loadState = LoadState.loading;
  List<Jokes> jokeList = [];

  HomeViewModel(){
    fetchJokes();
  }

  fetchJokes() async {
    try {
      loadState = LoadState.loading;
      List<Jokes>? jokes = await JokeService().fetchJokes();
      if (jokes != null) {
        jokeList = jokes;
        loadState = LoadState.completed;

      } else {
        loadState = LoadState.error;

      }

    } catch (e) {
      debugPrint("Error occured when fetching the jokes : $e");
      loadState = LoadState.error;
    }

    notifyListeners();
  }

  addOrRemoveFavourite(int index){
    jokeList[index].isFavourite=!(jokeList[index].isFavourite);
    notifyListeners();
  }
}
