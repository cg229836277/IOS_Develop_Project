//
//  SampleProtocol.h
//  LearnDevelop
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SampleProtocolDelegate <NSObject>
@required
- (void)processCompleted;
@end

@interface SampleProtocol:NSObject{
    id <SampleProtocolDelegate> _delegate;
}

@property (nonatomic,strong) id delegate;
-(void)startSampleProcess;
@end
