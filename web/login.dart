import "dart:html";
import "dart:convert";

//login form
InputElement loginUsername = querySelector("#login_username");
InputElement loginPassword = querySelector("#login_password");
ButtonElement sendLoginBtn = querySelector("#send_login");

void main() {

  sendLoginBtn.onClick.listen((_) {
    sendLogin(loginUsername.value, loginPassword.value);
  });

}

clearForms() {
  loginUsername.value = "";
  loginPassword.value = "";
}

sendLogin(String username, String password) {
  if (username.trim().isEmpty || password.trim().isEmpty) {
    return;
  }

  var user = {"username": username, "password": password};

  HttpRequest.request("/user/login", method: "POST",
  requestHeaders: {"content-type": "application/json"},
  sendData: JSON.encode(user)).then((request) {
    print(request.response);
    Map parsedMap = JSON.decode(request.response);

    if(parsedMap['result']) {
      window.location.href = 'index.html';
    } else {
      window.alert(parsedMap['error']);
    }

    clearForms();

  }, onError: (ProgressEvent e) {
    HttpRequest req = e.target;
    window.alert("status: ${req.status} response: ${req.responseText}");
  });
}
