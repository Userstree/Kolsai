//
// Created by Dossymkhan Zhulamanov on 17.06.2022.
//

import UIKit

class LikesViewController: UIViewController {
        
    var likedNewsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 25, height: 40)
//        layout.minimumLineSpacing = 1
    
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(LikedNewsCell.self, forCellWithReuseIdentifier: LikedNewsCell.identifier)
        return collection
    }()
    
    var jobUniverSegmentedControl = UISegmentedControl (items: ["Вакансии","Университеты"])
    var jobUniverTableView = UITableView()
    
    var likedNews: [UIColor] = [.red, .blue, .black, .orange, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        configureNewsCollectionView()
        configureSegmentedControl()
        configureTableView()
        
    }
    
    func configureNewsCollectionView() {
        likedNewsCollectionView.dataSource = self
        view.addSubview(likedNewsCollectionView)
        
        likedNewsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        likedNewsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        likedNewsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        likedNewsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        likedNewsCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureSegmentedControl() {
        view.addSubview(jobUniverSegmentedControl)
        
        jobUniverSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        jobUniverSegmentedControl.topAnchor.constraint(equalTo: likedNewsCollectionView.bottomAnchor).isActive = true
        jobUniverSegmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        jobUniverSegmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        jobUniverSegmentedControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureTableView() {
//        jobUniverTableView.dataSource = self
        view.addSubview(jobUniverTableView)
        
        jobUniverTableView.translatesAutoresizingMaskIntoConstraints = false
        jobUniverTableView.topAnchor.constraint(equalTo: jobUniverSegmentedControl.bottomAnchor).isActive = true
        jobUniverTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        jobUniverTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        jobUniverTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension LikesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        likedNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikedNewsCell.identifier, for: indexPath)
        cell.contentView.backgroundColor = likedNews[indexPath.row]
        return cell
    }
}

//extension LikesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        likedNews.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: JobUniverCell.identifier) as! JobUniverCell
//        cell.contentView.backgroundColor = likedNews[indexPath.row]
//        return cell
//    }
//}
