
abstract class LoginStates {}

class LoginInitialState extends LoginStates{}

class PasswordState extends LoginStates{}

class CreateDataBaseState extends LoginStates{}
class InsertToDataBaseState extends LoginStates{}
class GetDataBaseState extends LoginStates{}
class AuthentificationState extends LoginStates{}
class InsertProductToDataBaseState extends LoginStates{}
class GetProductState extends LoginStates{}
class UpdateProductState extends LoginStates{}
class DeleteProductState extends LoginStates{}
class ImagePickerState extends LoginStates{}