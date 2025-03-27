
String? nameValidator(String? value)
{
  if(value == null||value.isEmpty)
  {
    return "Name is required";
  }
  String pattern = r'^[a-zA-Z\s]+$';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(value)) {
    return 'Name must only contain letters and spaces';
  }

  
  return null;
}
String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  
  // Regular expression for basic email validation
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null; // Return null if email is valid
}



String? passwordValidator(String? value)
{
  if(value == null||value.isEmpty)
  {
    return "Password is required";
  }
  else if(value.length<8)
  {
    return "Please enter a valid password";
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password)
{
  if(value == null||value.isEmpty)
  {
    return "Password is required";
  }
  else if(value!=password)
  {
    return "Passwords do not match";
  }
  return null;
}

