//
//  HomeVC.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: BaseViewController {
    @IBOutlet weak var HomeTV: UITableView!
    let homeTableViewCell = "HomeTableViewCell"
    let branchesViewModel = BranchesViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeToBranchSelection()
        subscribeToLoading()
        subscribeToResponse()
        getBranches()
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        HomeTV.register(nib, forCellReuseIdentifier: "HomeTableViewCell")

    }
    
    
    
    func subscribeToLoading() {
        branchesViewModel.loadingBehavior.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
                
            } else {
                self.HideLoading()
            }
        }).disposed(by: disposeBag)
    }
    func subscribeToResponse() {
        self.branchesViewModel.branchesModelObservable
            .bind(to: self.HomeTV
                .rx
                .items(cellIdentifier: homeTableViewCell,
                       cellType: HomeTableViewCell.self)) { row, branch, cell in
                        print(row)
                        cell.Name.text = branch.name
                        cell.Price.text = "\(branch.price!)"
                        cell.configure(Product: branch)

                        
        }
        .disposed(by: disposeBag)
    }
    func subscribeToBranchSelection() {
        Observable
            .zip(HomeTV.rx.itemSelected, HomeTV.rx.modelSelected(ProductModelDatum.self))
            .bind { [weak self] selectedIndex, branch in
                
                print(selectedIndex, branch.name ?? "")
        }
        .disposed(by: disposeBag)
    }
    func getBranches() {
        branchesViewModel.ShowProduct()
    }
    
    
}
