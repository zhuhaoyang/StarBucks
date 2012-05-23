//
//  DatabaseManager.h
//  aliAlbum
//
//  Created by xugaoqiang on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@class FMDatabase;
@interface DatabaseManager : NSObject 
{
	FMDatabase *m_db;
}

+ (DatabaseManager*)sharedDatabaseManager;

- (BOOL)createTable:(NSString*) sSQL;

- (BOOL)deleteAllTable;
- (void)deleteBookMark:(NSArray *)arrBookMark;
- (void)deleteBook:(NSArray *)arrBook;
- (void)deleteBookShelf:(NSString *)bookShelf;

- (void)insertBookData:(NSArray *)arrBookData;
- (void)insertBookMark:(NSDictionary *)dicBookMark;
- (void)insertAPPSet;
- (void)insertBookShelf:(NSString *)bookShelf;

- (BOOL)queryDataIfExist:(NSString *)name tableName:(NSString*)tableName;
- (BOOL)queryBookMarkIfExist:(NSString *)bookMark tableName:(NSString*)tableName;
- (BOOL)queryBookShelfIfExist:(NSString *)bookShelf tableName:(NSString*)tableName;
- (NSArray *)queryBookDataFromTable;
- (NSArray *)queryBookMarkFromTable;
- (NSArray *)queryOneBookDataFromTable:(NSString *)bookName;
- (NSDictionary *)queryBookByBookshelfFromTable;
- (NSDictionary *)queryAPPSetFromTable;


- (void)updataLastRead:(NSDictionary *)dicLastRead;
- (void)updata:(NSString *)bookName bookshelf:(NSString *)bookshelf;
- (void)updataBookName:(NSString *)oldName newName:(NSString *)newName;
- (void)updata:(NSString *)attribute value:(NSString *)value;
- (void)updata:(NSString *)userName password:(NSString *)password;

@end