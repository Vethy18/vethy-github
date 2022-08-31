
abstract class LoginStates {}

class LoginInitialState extends LoginStates{}


class PasswordState extends LoginStates{}

class ListCopyToState extends LoginStates{}

class CreateDataBaseState extends LoginStates{}

class InsertToDataBaseState extends LoginStates{}

class GetDataBaseState extends LoginStates{}

class AuthentificationState extends LoginStates{}

class AuthentificationErrorState extends LoginStates{}

class InsertProductToDataBaseState extends LoginStates{}

class GetProductState extends LoginStates{}

class UpdateProductState extends LoginStates{}
class UpdateSelectedProductState extends LoginStates{}

class DeleteProductState extends LoginStates{}

class SearchProductState extends LoginStates{}

class ImagePickerState extends LoginStates{}

class ChangeSelectedItemState extends LoginStates{}