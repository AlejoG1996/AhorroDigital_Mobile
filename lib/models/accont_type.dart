class AccountType {
  int id=0;
  String name='';
  int numberRegister=0;

  AccountType({ required this.id,required  this.name,required this.numberRegister});

  AccountType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberRegister = json['numberRegister'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['numberRegister'] = this.numberRegister;
    return data;
  }
}