//
//  ViewController.swift
//  StoreDataOfDatabase
//
//  Created by chuck chan on 16/1/23.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataBase:COpaquePointer = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if openDatabase() == SQLITE_OK{
            print("open database successful")
        }else{
            print("open database file fail")
        }
        var createDataBase = "CREATE TABLE IF NOT EXISTS TEXTFILED(ID INTEGER PRIMARY KEY AUTOINCREMENT,TEXT TEXT)"
        var errorMessage:UnsafeMutablePointer<Int8> = nil
        var createDatabaseResult = sqlite3_exec(dataBase, createDataBase, nil, nil, &errorMessage)
        if createDatabaseResult == SQLITE_OK{
            print("build database successful")
        }else{
            print("build database file fail = \(errorMessage)")
        }
        sqlite3_close(dataBase)
    }
    
    @IBAction func saveData(sender: UIButton) {
        insertValue()
    }
    
    @IBAction func queryData(sender: UIButton) {
        queryDatabase()
    }
    
    func openDatabase()->Int32{
        var dataBasePath = getFilePath(fileName: "chuck.sqlite3")
        var fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(dataBasePath){
            print("数据库文件存在")
        }else{
            print("数据库文件不存在，正在创建")
        }
        
        var openDatabaseResult = sqlite3_open(dataBasePath, &dataBase)
        return openDatabaseResult
    }
    
    func insertValue(){
        if openDatabase() == SQLITE_OK{
            var insertSql = "INSERT INTO TEXTFILED(TEXT) VALUES ('CHUCK CHAN')"
            var insertResult = sqlite3_exec(dataBase, insertSql, nil, nil, nil)
            if insertResult == SQLITE_OK{
                print("插入数据成功")
            }else{
                print("插入数据失败")
            }
        }
        sqlite3_close(dataBase)
    }
    
    func queryDatabase(){
        var savedData:COpaquePointer = nil
        if openDatabase() == SQLITE_OK{
            var saveDataSql = "SELECT ID, TEXT FROM TEXTFILED"
            var insertResult = sqlite3_prepare_v2(dataBase, saveDataSql, -1, &savedData, nil)
            if insertResult == SQLITE_OK{
                while sqlite3_step(savedData) == SQLITE_ROW{
                    var id = sqlite3_column_int(savedData, 0)
                    var text = String.fromCString(UnsafePointer(sqlite3_column_text(savedData, 1)))
                    print("id = \(id)")
                    print("text = \(text!)")
                }
            }
        }
        sqlite3_finalize(savedData)
        sqlite3_close(dataBase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFilePath(fileName fileName : String)->String{
        var documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var documentPath = documentPaths[0].stringByAppendingString("/")
        print("document path = \(documentPath)")
        return documentPath.stringByAppendingString(fileName)
    }
}

