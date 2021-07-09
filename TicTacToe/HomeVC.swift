//
//  HomeVC.swift
//  TicTacToe
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    private let imageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "main")
        return img
    }()
    
    public let buttton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Start Game", for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return btn
    }()
    
    @objc func nextPage(){
        let vc = TicTacToeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TicTacToe Game"
        
        view.addSubview(imageView)
        view.addSubview(buttton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(x:20,y:130, width: view.width-40, height: 200)
        buttton.frame = CGRect(x:20,y:imageView.bottom+20,width: view.width-40, height: 40)
    }

}
