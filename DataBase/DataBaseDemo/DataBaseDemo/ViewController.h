//
//  ViewController.h
//  DataBaseDemo
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DBManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *searchRegisterNo;
@property (strong, nonatomic) IBOutlet UITextField *insertRegisterNo;
@property (strong, nonatomic) IBOutlet UITextField *insertName;
@property (strong, nonatomic) IBOutlet UITextField *insertDepartment;
@property (strong, nonatomic) IBOutlet UITextField *insertYear;

- (IBAction)startFind:(id)sender;

- (IBAction)startSave:(id)sender;

@end

