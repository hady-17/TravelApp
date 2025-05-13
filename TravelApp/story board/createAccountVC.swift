//
//  createAccountVC.swift
//  TravelApp
//
//  Created by hady ka on 13/05/2025.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var fields: [AccountField] = [
        AccountField(type: .name, value: "", placeholder: "Full Name"),
        AccountField(type: .email, value: "", placeholder: "Email Address"),
        AccountField(type: .password, value: "", placeholder: "Password")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InputCell.self, forCellReuseIdentifier: InputCell.identifier)
        tableView.tableFooterView = createFooter()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createFooter() -> UIView {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))

        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        footer.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])

        return footer
    }

    @objc private func handleCreateAccount() {
        view.endEditing(true)
        for field in fields {
            print("\(field.type): \(field.value)")
        }
        // Add your account creation logic here
    }

    // MARK: - UITableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InputCell.identifier, for: indexPath) as? InputCell else {
            return UITableViewCell()
        }

        let field = fields[indexPath.row]
        cell.textField.placeholder = field.placeholder
        cell.textField.text = field.value
        cell.textField.tag = indexPath.row
        cell.textField.delegate = self

        cell.textField.isSecureTextEntry = field.type == .password

        return cell
    }

    // MARK: - UITextField Delegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = textField.tag
        fields[index].value = textField.text ?? ""
    }
}
