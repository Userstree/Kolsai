//
//  ViewController.swift
//  Kolsai
//
//  Created by Dossymkhan Zhulamanov on 17.06.2022.
//
//

import UIKit


class MainTabBarVC: UITabBarController {

    private let titles: [String] = ["Новости", "Найти", "Избранные", "Чат", "Профиль"]
    private let images: [UIImage] = [UIImage(systemName: "book")!,
                                     UIImage(systemName: "magnifyingglass")!,
                                     UIImage(systemName: "heart")!,
                                     UIImage(systemName: "message")!,
                                     UIImage(systemName: "person")!
                                    ]

    private var feedVC = FeedViewController()
    private var jobsAndStudiesVC = JobsAndStydiesViewController()
    private var likesVC = LikesViewController()
    private var profileVC = ProfileViewController()
    private var chatVC = QAChatViewControllerL()

    override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .red

        makeTabBarViews()
    }

    private func makeTabBarViews() {

        setViewControllers([feedVC, jobsAndStudiesVC, likesVC, chatVC, profileVC], animated: false)

        guard let items = self.tabBar.items else { return }

        for i in 0..<items.count {
            items[i].title = titles[i]
            items[i].image = images[i]
        }
    }

}
