//
//  ViewController.swift
//  Basics
//
//  Created by Chaitanya Soni on 07/04/24.
//

import UIKit

struct UserDetails: UserDetailsProtocol {
    var name: String
    
    var educationDetails: EducationDetailsProtocol
}
struct EducationDetails: EducationDetailsProtocol {
    let startedYear: String
    var completedYear: String? {
        "\((Int(startedYear) ?? 0) + 4)"
    }
    let degree: String
}

struct UserDetails2: UserDetailsProtocol {
    var name: String = "asdasd"
    
    var educationDetails: EducationDetailsProtocol = EducationDetails2(startedYear: "1809", degree: "asdasdsa")
}
struct EducationDetails2: EducationDetailsProtocol {
    let startedYear: String
    var completedYear: String? {
        "\((Int(startedYear) ?? 0) + 4)"
    }
    let degree: String
}

protocol UserDetailsProtocol {
    var name: String { get }
    var educationDetails: EducationDetailsProtocol { get }
}
protocol EducationDetailsProtocol {
    var startedYear: String { get }
    var completedYear: String? { get }
    var degree: String { get }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var startYearLabel: UILabel!
    @IBOutlet weak var completedYearLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        return iv
    }()
    
    var name: String? = nil
    var userDetails: UserDetailsProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let switch = UISwitch()
        print(userDetails?.educationDetails.completedYear,
              userDetails?.educationDetails.startedYear)
        
        nameLabel.text = userDetails?.name
        nameLabel.font = .preferredFont(forTextStyle: .headline)
        nameLabel.backgroundColor = UIColor.systemPink
        
        
        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.layer.borderWidth = 5
        
        nameLabel.layer.shadowOpacity = 0.5
        nameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        nameLabel.layer.shadowColor = UIColor.blue.cgColor
        nameLabel.layer.shadowRadius = 5
        
        nameLabel.layer.cornerRadius = 20
        
        nameLabel.clipsToBounds = true
//        nameLabel.layer.masksToBounds = false
        
        degreeLabel.text = userDetails?.educationDetails.degree
        degreeLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        startYearLabel.text = userDetails?.educationDetails.startedYear
        startYearLabel.font = .preferredFont(forTextStyle: .body)
        
        completedYearLabel.text = userDetails?.educationDetails.completedYear
        completedYearLabel.font = .preferredFont(forTextStyle: .body)
        
        self.view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        
        imageView.topAnchor.constraint(equalTo: completedYearLabel.bottomAnchor).isActive = true
        
        button.tintColor = .yellow
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        
        self.view.backgroundColor = .cyan
        
        let tvc1 = TableViewController1.instantiate()
        self.navigationController?.pushViewController(tvc1, animated: true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print(segue)
    }
}

