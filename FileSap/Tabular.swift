//
//  Tabular.swift
//  FileSap
//
//  Created by Administrator on 02/05/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

import UIKit

class Tabular: UITableViewController{
    
    @IBOutlet var backbtn: UIBarButtonItem!
    
    final var url = URL(string: "http://127.0.0.1:8000/")
    var filename = [File]()
    var foldernames=[File]()
    var foldercount:Int = 0
    var filecount:Int = 0
    var folder_names = [String]()
    var file_names = [String]()
    var currentFolder:String=""
    var parentFolder:String=""
    var backcount:Int=0

    
    //var street:Int = 0
    //    let foldername = Array
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="File Explorer"
        self.navigationItem.leftBarButtonItem=nil
        
        sessionLoadData(downloadURL: url!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func sessionLoadData(downloadURL:URL) {
        guard let downloadURL = url else {return}
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse, error) in
            
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong with the download")
                
                return
                
            }
            
            print("success")
            do {
                let decoder = JSONDecoder()
                
                let downloadedfiles = try decoder.decode(File.self, from: data)
                self.foldernames = [downloadedfiles]
                DispatchQueue.main.async {
                    self.tableView.reloadData()                }
                
                //                let filenames = downloadedfiles.files
                self.foldercount = downloadedfiles.folders.count
                self.folder_names = downloadedfiles.folders
                self.filecount = downloadedfiles.files.count
                self.file_names = downloadedfiles.files
                self.currentFolder=downloadedfiles.current
                self.parentFolder=downloadedfiles.parent
                //                print(foldername[0])
            }catch{
                print("something went wrong after downloading")
            }
            }.resume()
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        if section == 1{
            return foldercount
        }
        else{
            return filecount
        }
        //return filenames.count
        //print(foldername)
        //return foldercount+filecount
        //foldername.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            
            return "The Current Directory is : \(self.currentFolder)"
        }
        if section == 1{
            return "List of Folders"
        }
        else{
            return "List of Files"
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(file_names)
        //print(file_names[1])
        if indexPath.section == 0{
           
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "where") else { return UITableViewCell() }
            cell.backgroundColor = UIColor.cyan
        }
        
        if indexPath.section == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tab") else { return UITableViewCell() }
                        cell.textLabel?.text = folder_names[indexPath.row]
                    return cell

        }
        
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tab2") else { return UITableViewCell() }
            cell.textLabel?.text = file_names[indexPath.row]
            return cell
        }
        
        
//        if(indexPath.row < foldercount){
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tab") else { return UITableViewCell() }
//            cell.textLabel?.text = folder_names[indexPath.row]
//        return cell
//    }
//            else{
//            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "tab2") else { return UITableViewCell() }
//        cell2.textLabel?.text = file_names[indexPath.row - foldercount]
//        return cell2
//
//        }
        
        
        //cell.parentnamelabel?.text = filenames[indexPath.row].parent
        // cell.parentfolderLabel.text = filenames[indexPath.row].parent
        //print(street)
        
        //street += 1
        
        //return cell
    }
    @IBAction func previous(sender:UIBarButtonItem){
        print("button tapped")
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.backcount=self.backcount+1
        if self.backcount > 0{
             self.navigationItem.leftBarButtonItem = self.backbtn
            self.url=URL(string:"http://127.0.0.1:8000/?folder="+"\(self.currentFolder)"+"//"+"\(folder_names[indexPath.row])")
            sessionLoadData(downloadURL: self.url!)
            tableView.reloadData()
        }
       
       
        print("You tapped cell number \(indexPath.section).")
        print("Cell cliked value is \(folder_names[indexPath.row])")
        
        
    }
    
    
}




