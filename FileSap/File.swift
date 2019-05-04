//
//  File.swift
//  FileExplorer
//
//  Created by GIC_UWI on 2019/5/1.
//  Copyright © 2019 GIC. All rights reserved.
//

import UIKit
//
//class FileList: Codable{
//    let filelist: [File]
//    
//    init(filelist: [File]){
//        self.filelist = filelist
//    }
//}

class File: Codable {
    //let current: String
    let folders, files: [String]
    let current, parent: String
    //let files: String
    //let parent: String
    init(folders:[String], files:[String], current:String, parent:String) {
        self.folders = folders
        self.files = files
        self.current = current
        self.parent = parent
    }
        //self.folders = folders
        
//    init(current: String, folders: String, files: String, parent: String
//        ) {
//        self.current = current
//        self.folders = folders
//        self.files = files
//        self.parent = parent
//
    //}
}
