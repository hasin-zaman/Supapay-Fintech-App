import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supapay/features/transactions/bloc/transactions_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
              transactionsBloc.add(TransactionsIntialEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionsLoadedState) {
              final transactions = state.transactions;
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final data = transactions[index];
                  return data.amount! > 0
                      ? Card(
                          child: ListTile(
                          leading: const Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.green,
                          ),
                          title: Text(data.from!),
                          subtitle: Text(data.date!),
                          trailing: Text(data.amount.toString()),
                          onTap: () {
                            showTransactionInfo(context, data);
                          },
                        ))
                      : Card(
                          child: ListTile(
                          leading: const Icon(
                            Icons.arrow_circle_left_rounded,
                            color: Colors.red,
                          ),
                          title: Text(data.to!),
                          subtitle: Text(data.date!),
                          trailing: Text(data.amount.toString()),
                          onTap: () {
                            showTransactionInfo(context, data);
                          },
                        ));
                },
              ).animate().fadeIn();
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
