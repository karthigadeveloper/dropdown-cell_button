//
//  ViewController.swift
//  dropdown_button
//
//  Created by Karthiga on 12/26/23.
//

import UIKit


struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    
}


class ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var  tableviewData = [cellData]()
    
    override func viewDidLoad() {
           super.viewDidLoad()
    
          tableviewData = [cellData(opened: false, title: "karthiga", sectionData: ["cell1","cell2","cell3"]),
                           cellData(opened: false, title: "sathish", sectionData: ["cell1","cell2","cell3"]),
                           cellData(opened: false, title: "kuhaan", sectionData: ["cell1","cell2","cell3"]),
                           cellData(opened: false, title: "nakshatra", sectionData: ["cell1","cell2","cell3"])]
        }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableviewData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewData[section].opened == true{
            return tableviewData[section].sectionData.count + 1
        }else  {
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableviewData[indexPath.section].opened == true{
            return 150
        }else if tableviewData[indexPath.section].opened == false  {
        return 50
    }
        return 0

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else{return TableViewCell()}
            cell.textLabel?.text = tableviewData[indexPath.section].title
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else{return TableViewCell()}
            cell.textLabel?.text = tableviewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 0{
        if tableviewData[indexPath.section].opened == true{
            
            tableviewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }else{
            tableviewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
//    }



}

