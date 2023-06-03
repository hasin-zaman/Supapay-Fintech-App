import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supapay/features/home/models/transaction_model.dart';
import 'package:supapay/features/signup/models/user_model.dart';
import 'package:supapay/features/signup/provider/user_data_provider.dart';
import 'package:supapay/global/routes.dart';
import 'package:supapay/global/validators.dart';

void main() {
  group('Check PhoneNumberValidation', () {
    test('Valid mobile number with country code', () {
      const phoneNumber = '+15551234567';
      expect(phoneNumber.isMobileNumberValid(), true);
    });

    test('Valid mobile number without country code', () {
      const phoneNumber = '1234567890';
      expect(phoneNumber.isMobileNumberValid(), true);
    });

    test('Invalid mobile number', () {
      const phoneNumber = '123';
      expect(phoneNumber.isMobileNumberValid(), false);
    });

    test('Empty mobile number', () {
      const phoneNumber = '';
      expect(phoneNumber.isMobileNumberValid(), false);
    });
  });

  group('Route Configuration', () {
    test('Check route "/welcome"', () {
      final widgetBuilder = routes['/welcome'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/signup"', () {
      final widgetBuilder = routes['/signup'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/phone-verification"', () {
      final widgetBuilder = routes['/phone-verification'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/otp"', () {
      final widgetBuilder = routes['/otp'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/congratulations"', () {
      final widgetBuilder = routes['/congratulations'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/login/phone-verification"', () {
      final widgetBuilder = routes['/login/phone-verification'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/login/otp"', () {
      final widgetBuilder = routes['/login/otp'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/login"', () {
      final widgetBuilder = routes['/login'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home"', () {
      final widgetBuilder = routes['/home'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/qr"', () {
      final widgetBuilder = routes['/home/qr'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/atms"', () {
      final widgetBuilder = routes['/home/atms'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/support"', () {
      final widgetBuilder = routes['/home/support'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/transactions"', () {
      final widgetBuilder = routes['/home/transactions'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/addFunds"', () {
      final widgetBuilder = routes['/home/addFunds'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });

    test('Check route "/home/sendFunds"', () {
      final widgetBuilder = routes['/home/sendFunds'];
      expect(widgetBuilder, isA<WidgetBuilder>());
    });
  });

  group('UserDataProvider', () {
    late UserDataProvider userDataProvider;

    setUp(() {
      userDataProvider = UserDataProvider();
    });

    test('Set user updates userData and notifies listeners', () {
      final userModel = UserModel(
          name: 'John Doe', dateOfBirth: DateTime(2000, 9, 7),
          email: "test@how.com",
          passcode: "1204",
          profileImageUrl: "",
          accountNumber: "923110887898",
          balance: 0,
          cardNumber: "571",
          cvvCode: "571",
          expiryDate: "05/20",
          iban: "PK SUPA 2000",
          monthlyIncome: 0,
          spendingLimit: 0,
          role: "Customer",
          );

      userDataProvider.setUser(userModel);

      expect(userDataProvider.userData, equals(userModel));
    });

    test('Clear user data sets userData to null and notifies listeners', () {
      userDataProvider.clearUserData();

      expect(userDataProvider.userData, isNull);
    });
  });

  group('TransactionModel', () {
    test('Create transaction model from JSON correctly', () {
      final json = {
        'id': '12345',
        'to': 'John Doe',
        'from': 'Jane Smith',
        'accNumber': '987654321',
        'amount': 1000,
        'date': '2022-01-01',
      };

      final transaction = TransactionModel.fromJson(json);

      expect(transaction.id, equals('12345'));
      expect(transaction.to, equals('John Doe'));
      expect(transaction.from, equals('Jane Smith'));
      expect(transaction.accNumber, equals('987654321'));
      expect(transaction.amount, equals(1000));
      expect(transaction.date, equals('2022-01-01'));
    });
  });


}
