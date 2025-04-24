import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/baby_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/spacers.dart';
import '../../../layout/presentation/view/layout_view.dart';
import 'baby_account_item.dart';
import '../../../../core/utils/app_styles.dart';

class SelectBabyAccountViewBody extends StatelessWidget {
  const SelectBabyAccountViewBody({super.key, required this.babies});
  final List<BabyModel> babies;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(40),
              Text(
                AppStrings.selectBabyAccount,
                style: AppStyles.roboto40Bold.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              VerticalSpace(40),
            ],
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, index) => BlocListener<LoginCubit, LoginState>(
            listenWhen: (__, current) => current is SelectBabyScuccess,
            listener: (context, state) {
              Navigator.pushReplacementNamed(context, LayoutView.routeName);
            },
            child: GestureDetector(
              onTap: () {
                context.read<LoginCubit>().selectBabyId(babies[index].id!);
              },
              child: BabyAccountItem(
                img: babies[index].profilePicUrl!.isEmpty
                    ? 'https://th.bing.com/th/id/OIP.3KfR6g7MEHXbm6Q-R1PzXQHaFj?rs=1&pid=ImgDetMain'
                    : babies[index].profilePicUrl!,
                name: babies[index].babyName!,
              ),
            ),
          ),
          separatorBuilder: (_, index) => VerticalSpace(40),
          itemCount: babies.length,
        ),
      ],
    );

    //   return Column(
    //     children: [

    //       Expanded(
    //         child:
    //       ),
    //     ],
    //   );
    // }
  }
}
