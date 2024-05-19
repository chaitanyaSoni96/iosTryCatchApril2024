//
//  CarouselViewController.swift
//  Login Example
//
//  Created by Chaitanya Soni on 20/04/24.
//

import UIKit

class CarouselViewController: UIViewController, StoryboardLoadable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CarouselCollectionViewCell",
                                      bundle: .main),
                                forCellWithReuseIdentifier: "carouselCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.startTimer()
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
        appDelegate?.userOnboarded = true

        self.navigationController?.setViewControllers([LoginViewController.instantiate()], animated: true)
    }
    
    func startTimer() {
        
        self.timer = Timer.scheduledTimer(timeInterval: 2,
                                          target: self,
                                          selector: #selector(self.scrollAutomatically(_:)),
                                          userInfo: nil,
                                          repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {
        
        DispatchQueue.main.async {
            for cell in self.collectionView.visibleCells {
                let indexPath: IndexPath? = self.collectionView.indexPath(for: cell)
                if ((indexPath?.row)! < 2){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    
                    self.collectionView.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    self.collectionView.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as? CarouselCollectionViewCell else { fatalError() }
        
        if indexPath.item == 0 {
            cell.imageView.backgroundColor = .cyan
        } else if indexPath.item == 1 {
            cell.imageView.backgroundColor = .lightGray
        } else {
            cell.imageView.backgroundColor = .blue
        }
        
        
        return cell
    }
    
    
}

extension CarouselViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.size)
        return collectionView.frame.size
    }
}
