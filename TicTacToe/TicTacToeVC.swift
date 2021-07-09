//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by DCS on 08/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    private var flag = false
    private let  winningCombination = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],
                                       [0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],
                                        [3,6,9,12],[0,5,10,15]]
    
    private let myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:120,left: 20,bottom: 20,right: 20)
        layout.itemSize = CGSize(width: 70, height: 75)
        
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout:layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myCollectionView)
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myCollectionView.frame = view.bounds
    }
}

extension TicTacToeVC: UICollectionViewDelegate,UICollectionViewDataSource {
    private func setupCollectionView(){
        myCollectionView.register(TicCell.self, forCellWithReuseIdentifier: "ticCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ticCell", for: indexPath) as! TicCell
        cell.setupCell(with: state[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            state.remove(at: indexPath.row)

            if flag {
                state.insert(0, at: indexPath.row)
            } else {
                state.insert(1, at: indexPath.row)
            }
            flag = !flag
            collectionView.reloadData()
            checkWinner()
        }
    }
    private func checkWinner()
    {
        if state.contains(3){
            let alert = UIAlertController(title: "Game Over", message: "Draw", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: { [weak self] _ in self?.resetGame()
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        for i in winningCombination {
            if state[i[0]] == state[i[1]] && state[i[1]] == state[i[2]] && state[i[2]] == state[i[3]] && state[i[0]] != 2{
                announceWinner(player: state[i[0]] == 0 ? "0" : "X")
                break
            }
        }
    }
    private func announceWinner(player: String){
        let alert = UIAlertController(title: "Game over!", message: "\(player) won", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
            self?.resetGame()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    private func resetGame()
    {
        state = [2,2,2,2,
                 2,2,2,2,
                 2,2,2,2,
                 2,2,2,2]
        flag = false
        myCollectionView.reloadData()
    }
}
