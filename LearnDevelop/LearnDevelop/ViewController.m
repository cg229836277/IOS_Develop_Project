//
//  ViewController.m
//  LearnDevelop
//
//  Created by chuckchan on 2020/4/14.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import "ViewController.h"
#import "SampleProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SampleProtocol *sampleProtocol = [[SampleProtocol alloc] init];
    sampleProtocol.delegate = self;
    [myLabel setText:@"Process..."];
    [sampleProtocol startSampleProcess];
}

#pragma mark Sample protocol delegate
-(void)processCompleted{
    [myLabel setText:@"process completed"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClicked:(id)sender {
    [myLabel setText:@"button clicked"];
}
@end
