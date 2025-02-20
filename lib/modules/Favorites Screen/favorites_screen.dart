import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/components/reusable_components.dart';
import '../../styles/colors.dart';
import '/shared/cubit/Food_Cubit/food_cubit.dart';
import '../../shared/cubit/Food_Cubit/food_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodStates>(
      builder: (BuildContext context, state) {
        return BuildCondition(
          condition: FoodCubit.get(context).favPosts.isNotEmpty &&
              FoodCubit.get(context).userModel != null,
          builder: (context) => SingleChildScrollView(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => postBuilder(
                  context: context,
                  isInHistory: false,
                  isInMyRequests: false,
                  postModel: FoodCubit.get(context).favPosts[index],
                  viewPost: true
                ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                itemCount: FoodCubit.get(context).favPosts.length),
          ),
          fallback: (context) => Center(
              child: Text(AppLocalizations.of(context)!.favoritesScreenFallback,style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: defaultColor),
              ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

