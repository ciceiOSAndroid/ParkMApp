
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Class
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.layer.cornerRadius = 20.0
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.attributedPlaceholder = NSAttributedString(string: "username@example.com",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        passwordTextField.layer.cornerRadius = 20.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    private func validateEmpty(string: String?) -> Bool {
        return string == "" ? false : true
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    private func validFields() -> Bool {
        guard let email = emailTextField.text else { return false }
        guard let password = emailTextField.text else { return false }
        if validateEmpty(string: email), isValidEmail(testStr: email), validateEmpty(string: password) {
            return true
        }
        return false
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        if validFields() {
            print("Campos válidos")
        } else {
            print("Campos no válidos")
        }
    }
    
    // MARK: - Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
