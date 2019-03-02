//
//  ViewController.swift
//  ExpandCollapseTableview
//
//  Created by Meenal Kewat on 3/2/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = UIColor.cyan
    }
    
    let data = [DataModel(headerName: "mens", subType: ["jeans","T-shirt","paints"], isExpandable: false),
                DataModel(headerName: "women", subType: ["top","plazo","saari"], isExpandable: false),
                DataModel(headerName: "kid", subType: ["frock","google","napkin"], isExpandable: false)]
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        headerView.delegate = self
        headerView.sectionIndex = section
        headerView.btn.setTitle(data[section].headerName, for: .normal)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpandable{
            return data[section].subType.count
        }else{
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.section].subType[indexPath.row]
        return cell!
    }
}

extension ViewController: headerDelegate{
    func callHeader(idx: Int) {
        data[idx].isExpandable = !data[idx].isExpandable
        tableview.reloadSections([idx], with: .automatic)
    }
    
    
}

