import UIKit


class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView! {
        // 메모리에 올라가 인스턴스화가 될 때 호출된다
        // 즉 화면에서 만든 이미지와 코드가 연결되었을 때 호출
        didSet {
            rightImageView.image = UIImage.init(systemName: "chevron.right")
            rightImageView.backgroundColor = .clear
            rightImageView.tintColor = .orange
            
        }
    }
}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // row count
        model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    

    
    // run only one
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "General"
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        model.append([GeneralModel(leftTitle: "About")])
        
        model.append(
            [GeneralModel(leftTitle: "KeyBoard"),
            GeneralModel(leftTitle: "Game Controller"),
            GeneralModel(leftTitle: "Fonts"),
            GeneralModel(leftTitle: "Language & Region"),
            GeneralModel(leftTitle: "Dictionary")])
        
        model.append([GeneralModel(leftTitle: "Dictionary")])
    }

}
