module Messages
  # error messages for post
  POST_TITLE_VALIDATION = "Title can't be blank."
  POST_TITLE_LENGTH_VALIDATION = "255 characters is the maximum allowed."
  POST_DESCRIPTION_VALIDATION = "Description can't be blank."
  POST_CREATE_SUCCESS = "Post successfully created."
  POST_UPDATE_SUCCESS = "Post successfully edited."

  # post upload error messages
  POST_UPLOAD_FILE_VALIDATION = "Please choose a file."
  POST_UPLOAD_CSV_FORMAT_ERROR = "Please choose a csv format."
  POST_UPLOAD_SUCCESS = "Post successfully uploaded."
  POST_UPLOAD_WRONG_HEADER = "Post upload file header is wrong."
  POST_UPLOAD_HEADER_COLUMN = "Post upload csv must have 3 colums."

  # error messages for user
  USER_NAME_VALIDATION = "Name can't be blank."
  USER_EMAIL_VALIDATION = "Email can't be blank."
  USER_EMAIL_REGIX_VALIDATION = "Email format is invalid."
  USER_PASSWORD_VALIDATION = "Password can't be blank."
  USER_PASSWORD_CONFIRMATION_VALIDATION = "Password confirmation can't be blank."
  USER_PASSWORD_CONFIRMATION_MATCHING_VALIDATION = "Password and Password confirmantion is not match."
  USER_PROFILE_VALIDATION = "Profile can't be blank."
  USER_PROFILE_FORMAT_VALIDATION = "Profile format must be jpg, png and gif."
  USER_CURRENTLY_LOGIN_DELETE = "Currently login user can't delete."
  USER_CREATE_SUCCESS = "User successfully created."
  USER_DELETE_SUCCESS = "User successfully deleted."

  USER_CHANGE_CURRENT_PASSWORD_VALIDATION = "Current password can't be blank."
  USER_CURRENT_PASSWORD_INVALID = "Current password is wrong!"
  USER_CHANGE_NEW_PASSWORD_VALIDATION = "New password can't be blank."
  USER_CHANGE_NEW_CONFIRM_PASSWORD_VALIDATION = "New confirm password can't be blank."
  USER_CHANGE_PASSWORD_CONFIRMATION_MATCHING_VALIDATION = "New password and New confirm password confirmantion is not match."

  # error messages for login
  EMAIL_NOT_EXISTS_VALIDATION = "Email does not Exits."
  PASSWORD_IS_NOT_CORRECT_VALIDATION = "Incorrect Password!"
  LOGIN_SUCCESS = "Login successful."
end