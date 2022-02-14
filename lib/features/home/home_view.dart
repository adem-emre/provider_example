import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/app_constant.dart';
import 'package:provider_example/enums/load_state_enum.dart';
import 'package:provider_example/features/favourites/favourites_view.dart';
import 'package:provider_example/features/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppConstant.homePageAppbarTitle),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavaouritesView()));
            }, icon: const Icon(Icons.favorite_outline))
          ],
        ),
        body: Consumer<HomeViewModel>(builder: (context, homeViewModel, _) {
          if (homeViewModel.loadState == LoadState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (homeViewModel.loadState == LoadState.error) {
            return const Center(
              child: Text(AppConstant.errorMessage),
            );
          } else {
            return ListView.builder(
                itemCount: homeViewModel.jokeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(homeViewModel.jokeList[index].joke ?? "N/A"),
                    subtitle:
                        Text(homeViewModel.jokeList[index].category ?? "N/A"),
                    trailing: IconButton(onPressed: (){
                      homeViewModel.addOrRemoveFavourite(index);
                    }, icon: Icon(Icons.favorite_outlined,color: homeViewModel.jokeList[index].isFavourite ? Colors.red:Colors.grey,)),
                  );
                });
          }
        }));
  }
}

