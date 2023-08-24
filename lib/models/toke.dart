import 'package:ahorrodigital_mobile/models/accont_type.dart';
import 'package:ahorrodigital_mobile/models/document_types.dart';
import 'package:ahorrodigital_mobile/models/user.dart';

class Token {
  String token = '';
  String expiration = '';
  User user = User(
    firstName: '',
    lastName: '',
    documentType: DocumentType(id: 0, name: '',numberRegister: 0),
    document: '',
    address: '',
    countryCode: "57",
    accountType: AccountType(id: 0, name: '',numberRegister: 0 ),
    accountNumber: '',
    bank: '',
    imageFullPath: '',
    userType: 0,
    fullName: '',
    savingAccount: 0,
    totalA: 0,
    loanAccount: 0,
    valueLoan: 0,
    valueLoanP: 0,
    valueLoanPag: 0,
    availLoan: 0,
    id: '',
    userName: '',
    email: '',
    phoneNumber: '',
  );

  Token({required this.token, required this.expiration, required this.user});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    data['user'] = this.user.toJson();
    return data;
  }
}