
class SignupData{
  String _username,_name,_first_name,_last_name,_email,_url,_nickname,_slug,_password,_roles;

  SignupData(
      this._username,
      this._name,
      this._first_name,
      this._last_name,
      this._email,
      this._url,
      this._nickname,
      this._slug,
      this._password,
      this._roles);

  get roles => _roles;

  get password => _password;

  get slug => _slug;

  get nickname => _nickname;

  get url => _url;

  get email => _email;

  get last_name => _last_name;

  get first_name => _first_name;

  get name => _name;

  String get username => _username;
}