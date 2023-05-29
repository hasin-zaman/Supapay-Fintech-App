import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supapay/features/home/bloc/home_bloc.dart';
import 'package:supapay/features/home/components/bottom_app_bar.dart';
import 'package:supapay/features/home/views/card_page.dart';
import 'package:supapay/features/home/views/profile_page.dart';
import '../components/qr_button.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  final HomeBloc homeBloc = HomeBloc();
  final transactions = [0, 1, 2, 3, 4, 5];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    homeBloc.add(HomePageUpdateEvent());
  }

  Future _onRefreshHome() {
    homeBloc.add(HomePageRefreshEvent());
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: null,
            bottomNavigationBar: bottomAppBar(_selectedIndex, _onItemTapped),
            floatingActionButton: const QRCodeButton(),
            body: StreamBuilder(
              builder: (context, snapshot) {
                if (state is HomeInitial) {
                  homeBloc.add(HomeInitialEvent());
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoadedState) {
                  return [
                    HomeScreen(
                        transactions: transactions, onRefresh: _onRefreshHome),
                    const CardScreen(),
                    const Text('Savings'),
                    const ProfileScreen()
                  ][_selectedIndex];
                } else {
                  final String s = (state as HomeErrorState).e;
                  return Center(
                    child: Text(s),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
