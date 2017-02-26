//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

@testable import ShadowEdge

class ShadowCell: UITableViewCell {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override class var layerClass: AnyClass {
    return EdgeShadowLayer.self
  }
}

class TableController: UITableViewController {
  
  override init(style: UITableViewStyle) {
    super.init(style: style)
    self.tableView.register(ShadowCell.self, forCellReuseIdentifier: "shadowCell")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "shadowCell", for: indexPath)
    return cell
  }
}