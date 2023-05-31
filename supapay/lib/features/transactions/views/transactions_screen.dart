import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supapay/features/transactions/bloc/transactions_bloc.dart';

import '../components/bottom_sheet.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});
  final TransactionsBloc transactionsBloc = TransactionsBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Transactions"),
        ),
        body: BlocConsumer<TransactionsBloc, TransactionsState>(
          bloc: transactionsBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TransactionsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionsLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    leading: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.green,
                    ),
                    title: const Text("Name"),
                    subtitle: const Text("Date"),
                    trailing: const Text("Amount"),
                    onTap: () {
                      showTransactionInfo(context);
                    },
                  ));
                },
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
