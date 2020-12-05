//
//  LoginVC.swift
//  MVVM With RXSwift
//
//  Created by Hany Karam on 12/5/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class LoginVC: BaseViewController {
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFieldsToViewModel()
        subscribeToLoading()
        subscribeToResponse()
        subscribeToLoginButton()
    }
    func bindTextFieldsToViewModel() {
        EmailTxt.rx.text.orEmpty.bind(to: loginViewModel.EmailBehavior).disposed(by: disposeBag)
        PasswordTxt.rx.text.orEmpty.bind(to: loginViewModel.PasswordBehavior).disposed(by: disposeBag)
    }
    func subscribeToLoading() {
        loginViewModel.loadingBehavior.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
                
            } else {
                self.HideLoading()
            }
        }).disposed(by: disposeBag)
    }
    func subscribeToResponse() {
        loginViewModel.loginModelObservable.subscribe(onNext: {
            if $0.status == true {
                let vc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ScreenID.Home)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                
            }
        }).disposed(by: disposeBag)
    }
    func subscribeToLoginButton() {
        loginButton.rx.tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.loginViewModel.Login()
            }).disposed(by: disposeBag)
    }
}

