//
//  ViewController.m
//  DataBaseDemo
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startFind:(id)sender {
    NSArray *resultArray = [[DBManager getDBInstance] findByRegisterNumber:_searchRegisterNo.text];
    if(resultArray == nil || resultArray.count == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Do not find data" message:nil delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        _insertYear.text = @"";
        _insertDepartment.text = @"";
        _insertName.text = @"";
        _insertRegisterNo.text = @"";
    } else {
        _insertYear.text = [resultArray objectAtIndex:2];
        _insertDepartment.text = [resultArray objectAtIndex:1];
        _insertName.text = [resultArray objectAtIndex:0];
        _insertRegisterNo.text = _searchRegisterNo.text;
    }
}

- (IBAction)startSave:(id)sender {
    BOOL result = NO;
    NSString *alertString = @"Save data failed";
    if(_insertRegisterNo.text.length > 0 && _insertName.text.length >0 && _insertDepartment.text.length > 0 && _insertYear.text.length > 0){
        result = [[DBManager getDBInstance]saveData:_insertRegisterNo.text name:_insertName.text department:_insertDepartment.text year:_insertYear.text];
    } else {
        alertString = @"Enter all fileds";
    }
    if(result == YES){
        alertString = @"Save data success";
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                          alertString message:nil delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
}


@end
