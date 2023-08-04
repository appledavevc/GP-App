//
//  CopyrightViewController.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 02/08/2023.
//

import UIKit

class CopyrightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        title = "Copyright"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 34), // Adjust the font size as needed
            .foregroundColor: UIColor.label // Use .label for automatic Dark Mode support
        ]
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Copyright"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        contentView.addSubview(titleLabel)

        let copyrightLabel = UILabel()
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.text = """
        All photos appearing on this app, unless noted otherwise, are the exclusive property of Ghent Photography and are protected under Belgian and International Copyright laws.

        Duplication, processing, distribution, manipulated or any form of commercialisation of such material shall require the prior written consent of Ghent Photography. These copyright laws impose substantial penalties for infringement, and violators will be prosecuted to the full extent of the law.
        All images are copyrighted © Ghent Photography.

        For information about reproduction rights, for any of the images contained on this site, please contact us through hello@ghentphotography.be.

        If you believe that any content or materials available on this app or website infringe your copyright, please contact us at hello@ghentphotography.be with the following information:

        - Your name, address, telephone number, and email address
        - A description of the copyrighted work that you claim has been infringed
        - The exact URL or a description of where the alleged infringing material is located
        - A statement by you that you have a good-faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law
        - A statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner's behalf.

        Ghent Photography takes allegations of copyright infringement very seriously. We respond to all valid notices of such infringement, and our policy is to terminate the accounts and/or membership of users who are found to be repeat infringers.
        
        Use of this app constitutes acceptance with the above copyright notice and all terms and conditions presented here.

        """
        copyrightLabel.numberOfLines = 0
        contentView.addSubview(copyrightLabel)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView constraints
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Title label constraints
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),

            // Copyright label constraints
            copyrightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            copyrightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            copyrightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            copyrightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }

}
