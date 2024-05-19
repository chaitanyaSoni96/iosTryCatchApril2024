//
//  TableView1Cell.swift
//  Basics
//
//  Created by Chaitanya Soni on 14/04/24.
//

import UIKit

class TableView1Cell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    var buttonTapCompletion: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: RESTAPIDevElement) {
        self.titleLabel.text = data.name
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        buttonTapCompletion?()
        print(#function)
    }
}
