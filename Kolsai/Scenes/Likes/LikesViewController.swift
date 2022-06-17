//
// Created by Dossymkhan Zhulamanov on 17.06.2022.
//

import UIKit
import SnapKit

class LikesViewController: UIViewController {

    private var temp: [String] = []
    private var likedNews: [UIColor] = [.red, .blue, .black, .orange, .brown, .gray, .red]
    private var likedJobs = ["Инженер-программист:\nот 80.000 тг", "Врач-терапевт:\nот 250.000 тг", "Машинист бульдозера:\nот 180.000 тг", "Воспитатель:\nот 100.000 тг", "Учитель математики (алгебра и геометрия):\nот 170.000 тг", "Рабочий по уходу за животными:\nот 70.000 тг"]
    private var likedUnivers = ["Казахский национальный университет имени Аль-Фараби", "Университет Сулейман Демиреля", "Карагандинский университет им. академика Е.А. Букетова", "Алматинский Университет Энергетики и Связи "]

    private lazy var likedNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(LikedNewsCell.self, forCellWithReuseIdentifier: LikedNewsCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.dataSource = self
        return collection
    }()

    private lazy var jobUniverSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl (items: ["Вакансии","Университеты"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .white
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()

    private lazy var jobUniverTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(JobUniverCell.self, forCellReuseIdentifier: JobUniverCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        configureViews()
    }

    @objc func indexChanged(_ sender: UISegmentedControl) {
        if jobUniverSegmentedControl.selectedSegmentIndex == 0 {
            temp = likedJobs
        } else if jobUniverSegmentedControl.selectedSegmentIndex == 1 {
            temp = likedUnivers
        }
        jobUniverTableView.reloadData()
    }

    private func configureViews() {
        [likedNewsCollectionView, jobUniverSegmentedControl, jobUniverTableView].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {

        likedNewsCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(100)
        }

        jobUniverSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(likedNewsCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        jobUniverTableView.snp.makeConstraints {
            $0.top.equalTo(jobUniverSegmentedControl.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension LikesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        likedNews.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikedNewsCell.identifier, for: indexPath)
        cell.contentView.backgroundColor = likedNews[indexPath.row]
        cell.contentView.layer.cornerRadius = 5.0
        return cell
    }
}

extension LikesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        temp.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JobUniverCell.identifier) as! JobUniverCell
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.text = temp[indexPath.row]
        return cell
    }
}

