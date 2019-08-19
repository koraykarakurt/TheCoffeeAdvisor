import UIKit

@IBDesignable 
open class UIMultiPicker: UIControl {
    
    @objc
    public var options: [String] = [] {
        didSet {
            picker.reloadComponent(0)
        }
    }
    
    @objc
    public var selectedIndexes: [Int] = [] {
        didSet {
            picker.reloadComponent(0)
        }
    }

    @objc
    public var font: UIFont = UIFont(name: "Georgia", size: 21)! {
        didSet {
            picker.setNeedsLayout()
        }
    }
    
    @objc
    public var textAlign: NSTextAlignment = .center {
        didSet {
            picker.setNeedsLayout()
        }
    }
    
    @IBInspectable
    public var color: UIColor = UIColor.black {
        didSet {
            picker.setNeedsLayout()
        }
    }
    
    @objc
    public func highlight(_ at: Int, animated: Bool = true) {
        picker.selectRow(at, inComponent: 0, animated: animated)
    }
    
    private let picker = UIMultiPickerView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    fileprivate func setup() {
        picker.parent = self
        addSubview(picker)
        picker.frame = bounds // Make picker spans parent view
        picker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

class UIMultiPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource
{
    weak var parent: UIMultiPicker!
    var proxy: TableViewProxy!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.delegate = self
        self.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
  
        layer.borderWidth = 0 // Main view rounded border

        // Component borders
        subviews.forEach {
            $0.layer.borderWidth = 0
            $0.isHidden = $0.frame.height <= 1.0
        }
        
        let tables = [
            subviews[0].subviews[0].subviews[0].subviews[0] as! UITableView, // top
            subviews[0].subviews[0].subviews[1].subviews[0] as! UITableView, // bottom
            subviews[0].subviews[0].subviews[2].subviews[0] as! UITableView, // center
        ]
        if tables[0].dataSource !== proxy {
            proxy = TableViewProxy(dataSource: tables[0].dataSource!)
            proxy.multiPicker = self.parent
            for table in tables {
                table.dataSource = proxy
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parent.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        UserDefaults.standard.set(row, forKey: "lastSelectedMultiPickerRow")
        return parent.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(row, forKey: "lastSelectedMultiPickerRow")
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int) {
        UserDefaults.standard.set(row, forKey: "lastSelectedMultiPickerRow")
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return parent.font.pointSize + 19
    }
}

class TableViewProxy: NSObject, UITableViewDataSource
{
    weak var multiPicker: UIMultiPicker!
    let dataSource: UITableViewDataSource
    
    init(dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataSource.tableView(tableView, cellForRowAt: indexPath)
        let label = cell.subviews[1] as! UILabel
        
        let tap = cell.gestureRecognizers![0] as! UITapGestureRecognizer
        cell.tag = indexPath.row
        tap.addTarget(self, action: #selector(self.handleCellTap))
        
        label.alpha = 1
        label.font = multiPicker.font
        label.textAlignment = multiPicker.textAlign
        label.textColor = multiPicker.selectedIndexes.contains(indexPath.row) ?
            multiPicker.tintColor :
            multiPicker.color
        
        return cell
    }
    
    @objc 
    func handleCellTap(sender: UITapGestureRecognizer) {
        let cell = sender.view as! UITableViewCell
        let row = cell.tag
        
        if (multiPicker.selectedIndexes.contains(row)) {
            multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter { $0 != row }
        } else {
            multiPicker.selectedIndexes += [row]
            //print(row)
            
            if row==6 // if espresso > 1 selected then disable spresso > 2
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 7}
            }
            else if row==7 // if espresso > 2 selected then disable spresso > 1
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 6}
            }
            
            if row==8 // if Kcal < 50 selected then disable Kcal < 100, Kcal < 200
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 9}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 10}
            }
            else if row==9 // if Kcal < 100 selected then disable Kcal < 50, Kcal < 200
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 8}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 10}
            }
            else if row==10 // if Kcal < 200 selected then disable Kcal < 50, Kcal < 100
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 8}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 9}
            }
            
            if row==11 // if size tall selected then disable size grande, venti
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 12}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 13}
            }
            else if row==12 // if size grande selected then disable size tall, venti
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 11}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 13}
            }
            else if row==13 // if size venti selected then disable size tall, grande
            {
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 11}
                multiPicker.selectedIndexes = multiPicker.selectedIndexes.filter {$0 != 12}
            }
            
            
        }
        multiPicker.sendActions(for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.tableView(tableView, numberOfRowsInSection: section)
    }
}
