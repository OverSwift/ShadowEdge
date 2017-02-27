//
//  TableViewController.swift
//  ShadowEdgeExample
//
//  Created by Sergiy Loza on 26.02.17.
//  Copyright © 2017 Sergiy Loza. All rights reserved.
//

import UIKit
import ShadowEdge

class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.contentInset.top += 30
    self.tableView.contentInset.bottom += 30
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.tableView.estimatedRowHeight = 44
    self.tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.navigationController?.navigationBar.topItem?.rightBarButtonItem = self.editButtonItem
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 45
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
    
    let rowsCount = tableView.numberOfRows(inSection: indexPath.section)
    if indexPath.row == 0 {
      cell.shadowEdge = [.leftEgge, .topEdge, .rightEdge]
      cell.shadowLayer.corner = [.topLeft, .topRight]
    } else if indexPath.row == rowsCount - 1 {
      cell.shadowEdge = [.leftEgge, .bottomEdge, .rightEdge]
      cell.shadowLayer.corner = [.bottomLeft, .bottomRight]
    } else {
      cell.shadowEdge = [.rightEdge, .leftEgge]
      cell.shadowLayer.corner = nil
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    tableView.moveRow(at: fromIndexPath, to: to)
    tableView.indexPathsForVisibleRows?.forEach({ (indexPath) in
      self.updateCellShadow(at: indexPath)
    })
  }
  
  private func updateCellShadow(at indexPath: IndexPath) {
    guard var cell = tableView.cellForRow(at: indexPath) as? TableViewCell else { return }
    let rowsCount = tableView.numberOfRows(inSection: indexPath.section)
    if indexPath.row == 0 {
      cell.shadowEdge = [.leftEgge, .topEdge, .rightEdge]
      cell.shadowLayer.corner = [.topLeft, .topRight]
    } else if indexPath.row == rowsCount - 1 {
      cell.shadowEdge = [.leftEgge, .bottomEdge, .rightEdge]
      cell.shadowLayer.corner = [.bottomLeft, .bottomRight]
    } else {
      cell.shadowEdge = [.rightEdge, .leftEgge]
      cell.shadowLayer.corner = nil
    }
  }
  
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
