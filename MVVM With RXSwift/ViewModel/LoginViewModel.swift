//
//  LoginViewModel.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
class LoginViewModel {
    var EmailBehavior = BehaviorRelay<String>(value: "")  
    var PasswordBehavior = BehaviorRelay<String>(value: "")
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    private var loginModelSubject = PublishSubject<LoginModel>()
    var loginModelObservable: Observable<LoginModel> {
        return loginModelSubject
    }
    
    func Login() {
        loadingBehavior.accept(true)
        let params = [
            "email": EmailBehavior.value,
            "password": PasswordBehavior.value,
        ]
        NetWorkManager.instance.API(method: .post, url: login,parameters:params) { [weak self](err, status, response:LoginModel?) in
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            self.loadingBehavior.accept(false)
            if let error = err {
                // network error
                print(error.localizedDescription)
            }
            else {
                guard let loginModel = response else { return }
                self.loginModelSubject.onNext(loginModel)
                print(response ?? "")
            }
        }
    }
}
