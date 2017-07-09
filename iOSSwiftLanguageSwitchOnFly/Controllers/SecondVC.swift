import UIKit

class SecondVC: BaseVC, LanguageListener {
    
    // MARK: Views
    
    @IBOutlet weak var labelVw: UILabel!
    @IBOutlet weak var btnVw: UIButton!
    
    // MARK: - Main Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguageListener(languageListener: self)
        initLanguage()
    }
    
    func initLanguage() {
        labelVw.text = "current_language".localized()
        btnVw.setTitle("change_language_btn".localized(), for: UIControlState.normal)
    }
    
    // MARK: - Actions
    
    @IBAction func changeLanguageBtnTapped(_ sender: Any) {
        LanguageManager.shareInstance.notifyLanguageChange()
    }
    
     // MARK: - Language Listener Protocols
    
    override func onLanguageChange() {
        initLanguage()
    }
    
}
