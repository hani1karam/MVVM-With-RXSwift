//
//  HomeViewModel.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire
class BranchesViewModel {
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    
    private var isTableHidden = BehaviorRelay<Bool>(value: false)
    private var branchesModelSubject = PublishSubject<[ProductModelDatum]>()
    
    var branchesModelObservable: Observable<[ProductModelDatum]> {
        return branchesModelSubject
    }
    var isTableHiddenObservable: Observable<Bool> {
        return isTableHidden.asObservable()
    }
    func ShowProduct() {
        loadingBehavior.accept(true)
        NetWorkManager.instance.API(method: .get, url: proudct) { [weak self](err, status, response:ProductModel?) in
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            if let error = err {
                print(error.localizedDescription)
            }  else {
                guard let branchesModel = response else { return }
                if branchesModel.data?.data?.count ?? 0 > 0 {
                    self.branchesModelSubject.onNext(branchesModel.data?.data ?? [])
                    self.isTableHidden.accept(false)
                } else {
                    self.isTableHidden.accept(true)
                }
            }
        }
    }
}

