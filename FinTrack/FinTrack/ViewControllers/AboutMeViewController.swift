import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var instagramButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var githubButton: UIButton!
    @IBOutlet var youtubeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func facebookButtonAction(_ sender: Any) {
        // Open URL
        if let url = URL(string: "https://www.facebook.com/igor.melashchenko/") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func instagramButtonAction(_ sender: Any) {
        // Open URL
        if let url = URL(string: "https://www.instagram.com/mr_igor25/") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func twitterButtonAction(_ sender: Any) {
        // Open URL
        if let url = URL(string: "https://www.twitter.com/mr_igor25") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func githubButtonAction(_ sender: Any) {
        // Open URL
        if let url = URL(string: "https://www.github.com/mr-igor25") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func youtubeButtonAction(_ sender: Any) {
        // Open URL
        if let url = URL(string: "https://www.youtube.com/channel/UCp3sqTC839txHNCqdBU-1Tw") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
