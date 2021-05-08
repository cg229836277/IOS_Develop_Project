//
//  DBManager.m
//  DataBaseDemo
//
//  Created by chuckchan on 2020/4/15.
//  Copyright © 2020年 chuckchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

static DBManager *dbInstance = nil;
static sqlite3 *dbbase = nil;
static sqlite3_stmt *dbStmt = nil;


@implementation DBManager

+(DBManager*)getDBInstance{
    if(!dbInstance){
        dbInstance = [[super allocWithZone:NULL]init];
        [dbInstance createDB];
    }
    return dbInstance;
}

-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    databasePath = [[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"student.db"]];
    BOOL success = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:databasePath] == NO){
        const char *dbpath = [databasePath UTF8String];
        if(sqlite3_open(dbpath, &dbbase) == SQLITE_OK){
            char *errorMsg;
            const char *sqlite_stmt = "create table if not exists studentsDetail (regno integer primary key, name text, department text, year text)";
            if(sqlite3_exec(dbbase, sqlite_stmt, NULL, NULL, &errorMsg) != SQLITE_OK){
                success = NO;
            }
            sqlite3_close(dbbase);
            return success;
        } else {
            success = NO;
        }
    }
    return success;
}

-(BOOL)saveData:(NSString *)registerNumber name:(NSString *)name department:(NSString *)department year:(NSString *)year{
    BOOL result = false;
    const char *dbPath = [databasePath UTF8String];
    if(sqlite3_open(dbPath, &dbbase) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"insert into \
                               studentsDetail (regno,name, department, year) values \
                               (\"%d\",\"%@\", \"%@\", \"%@\")",[registerNumber integerValue],name, department, year];
         const char *insertStmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(dbbase,insertStmt,-1,&dbStmt,NULL);
        if(sqlite3_step(dbStmt) == SQLITE_DONE){
            result = true;
        } else {
            result = false;
        }
        sqlite3_reset(dbStmt);
    }
    return result;
}

-(NSArray*)findByRegisterNumber:(NSString *)registerNumber{
    
    // 声明数组对象
    NSMutableArray *mArr = nil;
    const char *dbPath = [databasePath UTF8String];
    if(sqlite3_open(dbPath, &dbbase) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"select name, department, year from studentsDetail where regno=\"%@\"",registerNumber];
        const char *query_stmt = [querySQL UTF8String];
        // 此函数的作用是生成一个语句对象，此时sql语句并没有执行，创建的语句对象，保存了关联的数据库，执行的sql语句，sql语句的长度等信息
        int result = sqlite3_prepare_v2(dbbase, query_stmt, -1, &dbStmt, NULL);
        if (result == SQLITE_OK) {
            
            // 为数组开辟空间
            mArr = [[NSMutableArray alloc]init];
            
            // SQLite_ROW仅用于查询语句，sqlite3_step()函数执行后的结果如果是SQLite_ROW，说明结果集里面还有数据，会自动跳到下一条结果，如果已经是最后一条数据，再次执行sqlite3_step()，会返回SQLite_DONE，结束整个查询
            while (sqlite3_step(dbStmt) == SQLITE_ROW) {
                
                // 获取记录中的字段值
                // 第一个参数是语句对象，第二个参数是字段的下标，从0开始
//                int cRegno = sqlite3_column_int(dbStmt, 0);
                const unsigned char *cName = sqlite3_column_text(dbStmt, 0);
                const unsigned char *cDepartment = sqlite3_column_text(dbStmt, 1);
                const unsigned char *cYear = sqlite3_column_text(dbStmt, 2);
                
                // 将获取到的C语言字符串转换成OC字符串
//                NSString *regno = [NSString stringWithUTF8String:(const char *)cRegno];
                NSString *name = [NSString stringWithUTF8String:(const char *)cName];
                NSString *department = [NSString stringWithUTF8String:(const char *)cDepartment];
                NSString *year = [NSString stringWithUTF8String:(const char *)cYear];
                
                // 添加学生信息到数组中
//                [mArr addObject:regno];
                [mArr addObject:name];
                [mArr addObject:department];
                [mArr addObject:year];
                break;
            }
            sqlite3_reset(dbStmt);
            return mArr;
        }
    }
    return nil;
}




@end
