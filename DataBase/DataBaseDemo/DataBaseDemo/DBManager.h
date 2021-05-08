//
//  DBManager.h
//  DataBaseDemo
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager:NSObject{
    NSString *databasePath;
}

+(DBManager*) getDBInstance;
-(BOOL) createDB;
-(BOOL) saveData:(NSString*)registerNumber name:(NSString*)name department:(NSString*)department year:(NSString*)year;
-(NSArray*) findByRegisterNumber:(NSString*)registerNumber;

@end
