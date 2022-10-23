//
//  ViewController.swift
//  Networking
//
//  Created by Артем Галай on 23.10.22.
//

import UIKit

class ViewController: UIViewController {

    var networkManager = NetworkManager()

    private lazy var downloadPostsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "download")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(downloadPostsTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to download post"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(downloadPostsButton)
        view.addSubview(titleLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            downloadPostsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadPostsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            downloadPostsButton.widthAnchor.constraint(equalToConstant: 200),
            downloadPostsButton.heightAnchor.constraint(equalToConstant: 150),

            titleLabel.bottomAnchor.constraint(equalTo: downloadPostsButton.topAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func downloadPostsTapped() {
        networkManager.getAllPosts { (posts) in
            DispatchQueue.main.async {
                self.titleLabel.text = "Posts has been downloaded!"
            }
        }
    }
}
