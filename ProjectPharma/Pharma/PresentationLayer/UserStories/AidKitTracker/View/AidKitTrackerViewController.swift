//
//  AidKitTrackerViewController.swift
//  Pharma
//
//  Created by Антон Текутов on 19.06.2021.
//

import UIKit

final class AidKitTrackerViewController: UIViewController {
    
    var viewModel: AidKitTrackerViewModelProtocol!
    var coordinator: AidKitTrackerCoordinatorProtocol!
    
    private var _view: AidKitTrackerView {
        return view as! AidKitTrackerView
    }
    
    var supplements: [AidKitSupplement] {
        viewModel.supplements
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .res.tintMain()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        _view.supplementAidKitTable.reloadData()
    }

    override func loadView() {
        self.view = AidKitTrackerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSelf()
    }

    private func configureSelf() {
        _view.supplementAidKitTable.dataSource = self
        _view.supplementAidKitTable.delegate = self
    }
}

// MARK: - SupplementAidKit table management

extension AidKitTrackerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SupplementAidKitTableViewCell.identifier,
                                                 for: indexPath) as! SupplementAidKitTableViewCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let content = supplements[exist: indexPath.row] {
            cell.setContent(content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.tapAnimation()
        if let content = supplements[exist: indexPath.row] {
            coordinator.openSupplementEditor(supplement: content)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return supplements.isEmpty ? 1 : 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIConstants.screenBounds.width, height: 48))
        view.backgroundColor = .res.background()
        
        let stack = UIStackView()
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 9
        
        let title = UILabel()
        title.text = "11:00"
        UIStyleManager.labelH2(title)
        stack.addArrangedSubview(title)
        
        let dateLabel = UILabel()
        UIStyleManager.labelSmall(dateLabel)
        stack.addArrangedSubview(dateLabel)
        
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())!
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        dateLabel.text = formatter.string(from: date)
        
        if supplements.isEmpty {
            title.text = "Вы еще не добавили ни одного бада"
            dateLabel.text = ""
        }
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 6),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
}
