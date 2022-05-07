//
//  MainViewController.swift
//  RxDataSourceEx
//
//  Created by 박상우 on 2022/05/07.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class MainViewController: UIViewController {
    private let tableView = UITableView()
    RxTableViewRe
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionOfMain>?
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDataSource()
        setupBinding()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
    }

private func setupDataSource() {
    let dataSource = RxTableViewSectionedReloadDataSource<SectionOfMain> {
        _, tableView, indexPath, item in
        let cellId = String(describing: item.cellType)
        tableView.register(item.cellType, forCellReuseIdentifier: cellId)
        tableView.register(item.cellType, forCellReuseIdentifier: cellId)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        (cell as? MainCellDataProtocol)?.apply(item: item)
        return cell
    }
    self.dataSource = dataSource
    
    viewModel.sections
        .observe(on: MainScheduler.instance)
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellData = try? dataSource?.model(at: indexPath) as? MainCellData else { return 0 }
        
        return cellData.cellType.cellHeight(item: cellData)
    }
}
