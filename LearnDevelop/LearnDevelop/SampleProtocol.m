//
//  SampleProtocol.m
//  LearnDevelop
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleProtocol.h"

@implementation SampleProtocol
-(void)startSampleProcess{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate selector:@selector(processCompleted) userInfo:nil repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate selector:@selector(processCompleted) userInfo:nil repeats:NO];
}
@end
