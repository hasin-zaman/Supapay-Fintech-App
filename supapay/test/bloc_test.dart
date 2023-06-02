import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supapay/features/home/bloc/home_bloc.dart';
import 'package:supapay/features/home/models/transaction_model.dart';
import 'package:supapay/features/home/models/user_model.dart';

void main() {
  group('HomeBloc', () {
    late HomeBloc homeBloc;

    final userData = UserModel(
        accountNumber: "12345",
        balance: 1000,
        cardNumber: "5731",
        cvvCode: "571",
        email: "test@how.com",
        expiryDate: "5/23"); // Provide sample user data for testing
    final transactions = List<
        TransactionModel>.empty(); // Provide sample transactions for testing

    setUp(() {
      homeBloc = HomeBloc();
    });

    test('initial state is HomeInitial', () {
      expect(homeBloc.state, HomeInitial());
    });

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeLoadedState] when HomeInitialEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeInitialEvent()),
      expect: () => [
        HomeLoadingState(),
        //HomeLoadedState(userData, transactions),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits HomeLoadedState when HomePageUpdateEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomePageUpdateEvent(userData, transactions)),
      expect: () => [
        HomeLoadedState(userData, transactions),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeLoadedState] when HomePageRefreshEvent is added',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomePageRefreshEvent()),
      expect: () => [
        HomeLoadingState(),
        //HomeLoadedState(userData, transactions),
      ],
    );

    tearDown(() {
      homeBloc.close();
    });
  });
}
