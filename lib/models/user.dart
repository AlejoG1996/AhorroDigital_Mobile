import 'package:ahorrodigital_mobile/models/accont_type.dart';
import 'package:ahorrodigital_mobile/models/document_types.dart';

class User {
	String firstName ='';
	String lastName ='';
	DocumentType documentType=DocumentType(id: 0, name: '', numberRegister: 0);
	String document ='';
	String address ='';
	String countryCode ='';
	AccountType accountType =AccountType(id: 0, name: '', numberRegister: 0);
	String accountNumber ='';
	String bank ='';
	String imageFullPath ='';
	int userType =0;
	String fullName ='';
	int savingAccount =0;
	int totalA =0;
	int loanAccount =0;
	int valueLoan =0;
	int valueLoanP =0;
	int valueLoanPag =0;
	int availLoan =0;
	String id ='';
	String userName ='';
	String email ='';
	String phoneNumber ='';
	

	User({
    required this.firstName, 
    required this.lastName, 
    required this.documentType, 
    required this.document,
    required this.address, 
    required this.countryCode, 
    required this.accountType, 
    required this.accountNumber,
    required this.bank, 
    required this.imageFullPath, 
    required this.userType, 
    required this.fullName, 
    required this.savingAccount, 
    required this.totalA, 
    required this.loanAccount, 
    required this.valueLoan,
    required this.valueLoanP,
    required this.valueLoanPag, 
    required this.availLoan,
    required this.id, 
    required this.userName,  
    required this.email,  
    required this.phoneNumber, 
       
    });

	User.fromJson(Map<String, dynamic> json) {
		firstName = json['firstName'];
		lastName = json['lastName'];
		documentType = DocumentType.fromJson(json['documentType']);
		document = json['document'];
		address = json['address'];
		countryCode = json['countryCode'];
		accountType = AccountType.fromJson(json['accountType']);
		accountNumber = json['accountNumber'];
		bank = json['bank'];
		imageFullPath = json['imageFullPath'];
		userType = json['userType'];
		fullName = json['fullName'];
		savingAccount = json['savingAccount'];
		totalA = json['totalA'];
		loanAccount = json['loanAccount'];
		valueLoan = json['valueLoan'];
		valueLoanP = json['valueLoanP'];
		valueLoanPag = json['valueLoanPag'];
		availLoan = json['availLoan'];
		id = json['id'];
		userName = json['userName'];
		email = json['email'];
		phoneNumber = json['phoneNumber'];		
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['firstName'] =  this.firstName;
		data['lastName'] =  this.lastName;
    data['documentType'] =  this.documentType.toJson();
		data['document'] =  this.document;
		data['address'] =  this.address;
		data['countryCode'] =  this.countryCode;
    data['accountType'] =  this.accountType.toJson();
		data['accountNumber'] =  this.accountNumber;
		data['bank'] =  this.bank;
		data['imageFullPath'] =  this.imageFullPath;
		data['userType'] =  this.userType;
		data['fullName'] =  this.fullName;
		data['savingAccount'] =  this.savingAccount;
		data['totalA'] =  this.totalA;
		data['loanAccount'] =  this.loanAccount;
		data['valueLoan'] =  this.valueLoan;
		data['valueLoanP'] =  this.valueLoanP;
		data['valueLoanPag'] =  this.valueLoanPag;
		data['availLoan'] =  this.availLoan;
		data['id'] =  this.id;
		data['userName'] =  this.userName;
		data['email'] =  this.email;		
		data['phoneNumber'] =  this.phoneNumber;
		
		return data;
	}
}