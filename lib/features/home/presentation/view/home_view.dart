import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:napd/core/controller/cubit/get_mother_cubit/get_mother_profile_cubit.dart';
import 'package:napd/features/baby/presentation/cubit/get_baby_cubit/get_baby_cubit.dart';
import 'package:napd/features/home/presentation/cubits/search_bloc/home_search_bloc.dart';
import 'package:napd/features/home/presentation/widgets/named_category_card.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../cubits/gallrey_cubit/gallrey_cubit.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injector<GetMotherProfileCubit>()..getMotherProfile(),
        ),
        BlocProvider(
          create: (context) => injector<GetBabyCubit>()..getBaby(),
        ),
        BlocProvider(
          create: (context) => injector<GallreyCubit>(),
        ),
        BlocProvider(
          create: (context) => injector<HomeSearchBloc>(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: HomeAppBar(
            onChanged: (value) {
              context.read<HomeSearchBloc>().add(
                    HomeOnSearchEvent(query: value),
                  );
            },
          ),
          drawer: CustomDrawer(),
          body: BlocBuilder<HomeSearchBloc, HomeSearchState>(
            builder: (context, state) {
              if (state is HomeSearchEmpty || state is HomeSearchInitial) {
                return HomeViewBody();
              }
              if (state is HomeSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeSearchLoaded) {
                return CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return NameCategoryCard(
                          name: state.searchModel.activities[index].title,
                          category: 'activity',
                        );
                      },
                      itemCount: state.searchModel.activities.length,
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return NameCategoryCard(
                          name: state.searchModel.articles[index].title,
                          category: 'article',
                        );
                      },
                      itemCount: state.searchModel.articles.length,
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return NameCategoryCard(
                          name: state.searchModel.hospitals[index].title!,
                          category: 'hospital',
                        );
                      },
                      itemCount: state.searchModel.hospitals.length,
                    ),
                  ],
                );
              }

              if (state is HomeSearchFailure) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return SizedBox.shrink();
            },
          ),
        );
      }),
    );
  }
}
