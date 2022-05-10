//
//  ToDoCell.swift
//  todo-http
//
//  Created by Иван Трубецкой on 10.05.2022.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var itemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(todo: Todo) {
        itemLbl.text = todo.item
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            break
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break
        default:
            priorityView.backgroundColor = #colorLiteral(red: 0.9829411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
