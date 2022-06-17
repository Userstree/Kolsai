//
// Created by Dossymkhan Zhulamanov on 17.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    private var nameLable: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private var profileImageView: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    private var headers: [String] = ["Настройки","Дополнительно"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        safeArea = view.layoutMarginsGuide
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource  {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }

}

