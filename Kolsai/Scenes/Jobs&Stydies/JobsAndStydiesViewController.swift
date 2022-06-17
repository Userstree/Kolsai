//
// Created by Dossymkhan Zhulamanov on 17.06.2022.
//

import UIKit
import SnapKit
import Koloda

class JobsAndStydiesViewController: UIViewController {

    private let images: [UIImage] = [UIImage(systemName: "person")!, UIImage(systemName: "e.circle")!]

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.selectedSegmentIndex = 0

        return segmentedControl
    }()

    private lazy var kolodaView: KolodaView = {
        let koloda = KolodaView()
        koloda.backgroundColor = .yellow
        koloda.backgroundColor = .lightGray
        koloda.dataSource = self
        koloda.delegate = self
        koloda.layer.cornerRadius = 16
        return koloda
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        configureViews()
    }

    private func configureViews() {
        [kolodaView].forEach(view.addSubview)
        makeConstraints()
    }
    
    private func makeConstraints() {
        kolodaView.snp.makeConstraints({
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0))
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40))
        })
    }
}

extension JobsAndStydiesViewController: KolodaViewDataSource, KolodaViewDelegate {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        images.count
    }

    public func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        UIImageView(image: images[index])
    }
}
