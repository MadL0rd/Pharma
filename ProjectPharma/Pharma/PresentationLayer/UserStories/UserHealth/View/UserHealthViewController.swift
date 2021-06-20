//
//  UserHealthViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class UserHealthViewController: UIViewController {

    var viewModel: UserHealthViewModelProtocol!
    var coordinator: UserHealthCoordinatorProtocol!
    
    private var _view: UserHealthView {
        return view as! UserHealthView
    }
    
    private var content = [UserHealthTableViewCellContent]()

    override func loadView() {
        self.view = UserHealthView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .res.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        reloadContent()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        generateContentFromUserData(profile: .init())
        
        _view.permissionButton.addTarget(self, action: #selector(permissionButtonDidTapped(sender:)), for: .touchUpInside)
        
        _view.userHealthTable.dataSource = self
        _view.userHealthTable.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [ weak self ] in
            self?.reloadContent()
        }
    }
    
    private func reloadContent() {
        viewModel.loadUserHealthProfile(completion: generateContentFromUserData(profile:))
    }
    
    private func generateContentFromUserData(profile: UserHealthProfile) {
        let defaultValue = "-"
        
        content = [
            .init(title: .res.userHealthAge(), value: profile.age != nil ? String(profile.age!) : defaultValue),
            .init(title: .res.userHealthBiologicalSex(), value: profile.biologicalSex?.stringRepresentation ?? defaultValue),
            .init(title: .res.userHealthBloodType(), value: profile.bloodType?.stringRepresentation ?? defaultValue)
        ]
        
        if let weight = profile.weightInKilograms {
            let weightFormatter = MassFormatter()
            weightFormatter.isForPersonMassUse = true
            content.append(.init(title: .res.userHealthWeightInKilograms(), value: weightFormatter.string(fromKilograms: weight)))
        } else {
            content.append(.init(title: .res.userHealthWeightInKilograms(), value: defaultValue))
        }
        
        if let height = profile.heightInMeters {
            let heightFormatter = LengthFormatter()
            heightFormatter.isForPersonHeightUse = true
            content.append(.init(title: .res.userHealthHeightInMeters(), value: heightFormatter.string(fromMeters: height)))
        } else {
            content.append(.init(title: .res.userHealthHeightInMeters(), value: defaultValue))
        }
        
        if let bodyMassIndex = profile.bodyMassIndex {
            content.append(.init(title: .res.userHealthBodyMassIndex(), value: String(format: "%.02f", bodyMassIndex)))
        } else {
            content.append(.init(title: .res.userHealthBodyMassIndex(), value: defaultValue))
        }
        
        _view.userHealthTable.reloadData()
    }
    
    // MARK: - UI elements actions

    @objc private func permissionButtonDidTapped(sender: UIButton) {
        sender.tapAnimation()
        
        let loadingHUD = AlertManager.getLoadingHUD(on: view)
        loadingHUD.show(in: view)
        
        viewModel.authorizeHealthKit(completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [ weak self ] in
                self?.reloadContent()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [ weak self ] in
                loadingHUD.dismiss()
                self?.reloadContent()
            }
        })
    }
}

// MARK: - Articles table management

extension UserHealthViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserHealthTableViewCell.identifier,
                                                 for: indexPath) as! UserHealthTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let content = content[exist: indexPath.row] {
            cell.setContent(content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.tapAnimation()
    }
}
