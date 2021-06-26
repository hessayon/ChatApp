

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: K.alertTitle, message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: K.alertButtonTitle, style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)

                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }

    }
    
}
