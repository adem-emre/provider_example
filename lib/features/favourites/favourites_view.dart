
import 'package:flutter/material.dart';
import 'package:provider_example/constants/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/home/home_view_model.dart';
import 'package:provider_example/features/home/joke_model.dart';

class FavaouritesView extends StatelessWidget {
  const FavaouritesView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstant.favouritesPageAppbarTitle),),
      body: ListView.builder(
        itemCount: context.read<HomeViewModel>().jokeList.length,
        itemBuilder: (context,index){
          Jokes currentJoke = context.read<HomeViewModel>().jokeList[index];
         if(currentJoke.isFavourite == true){
           return ListTile(
                    title: Text(currentJoke.joke ?? "N/A"),
                    subtitle:
                        Text(currentJoke.category ?? "N/A"),
                    
                  );
         }else{
           return const SizedBox();
         }
        }),
    );
  }
}