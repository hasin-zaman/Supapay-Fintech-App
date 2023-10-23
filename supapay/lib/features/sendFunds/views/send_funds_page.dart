import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supapay/features/sendFunds/bloc/send_funds_bloc.dart';
import 'package:supapay/global/components/view_heading.dart';

class SendFundsPage extends StatelessWidget {
  SendFundsPage({super.key});
  final SendFundsBloc sendFundsBloc = SendFundsBloc();
  final _formKey = GlobalKey<FormState>();
  final accountNumber = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final accountPassed = ModalRoute.of(context)?.settings.arguments as String?;
    accountNumber.text = accountPassed ?? '';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Send Funds")),
      body: BlocConsumer<SendFundsBloc, SendFundsState>(
        bloc: sendFundsBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SendFundsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SendFundsErrorState) {
            return const Center(
              child: Text("Something Went Wromg"),
            );
          } else if (state is SendFundsSuccessState) {
            String response = state.response;
            if (response == "OK") {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ViewHeading(heading: "Transaction Successful!", color: Colors.green),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Go Back"))
                ],
              ));
            } else {
              return Center(child: Text(response));
            }
          }
          return SingleChildScrollView(
            child: Column(children: [
              Row(
                children: const [
                  Spacer(),
                  Icon(Icons.send_rounded, size: 100),
                  Spacer()
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: accountNumber,
                          enableSuggestions: true,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Account Number';
                            }

                            if (double.tryParse(value) == null) {
                              return "Please enter a valid Amount";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Account Number",
                              hintText: '03XXXXXXXXX',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: amount,
                          enableSuggestions: true,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Amount';
                            }
                            if (double.tryParse(value) == null) {
                              return "Please enter a valid Amount";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: "Amount",
                              hintText: '',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          child: const Text("Send"),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            sendFundsBloc.add(SendFundsProcessingEvent(
                                int.parse(amount.text), accountNumber.text));
                          },
                        ),
                      )
                    ],
                  ))
            ]),
          );
        },
      ),
    ));
  }
}
