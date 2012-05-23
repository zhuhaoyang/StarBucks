//
//  DatabaseManager.m
//  aliAlbum
//
//  Created by xugaoqiang on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DatabaseManager.h"
#import "FMDatabase.h"
#import "PublicDefine.h"

#define Database_File_Name @"StarBucks.db"

static DatabaseManager *instance = nil;

@interface DatabaseManager(private)
- (void) createSomeTables;
@end

@implementation DatabaseManager

- (id)init
{
	self = [super init];
	if (self)
	{
		// Check database file and create the db file if it doesn't exist.
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentDirectory = [paths objectAtIndex:0];
		NSString *dbPath = [documentDirectory stringByAppendingPathComponent:Database_File_Name];
		m_db = [[FMDatabase alloc] initWithPath:dbPath];
		// Create some tables
//		[self createSomeTables];
	}
	return self;
}

- (void)dealloc
{
	[m_db release];
	[super dealloc];
}

#pragma mark -
#pragma mark Class Methods
+ (DatabaseManager*)sharedDatabaseManager
{
	if (nil == instance)
	{
		instance = [[self alloc] init];
	}
	return instance;
}

#pragma mark -
#pragma mark Database Operation
- (BOOL)createTable:(NSString*) sSQL
{
	if (![m_db open])
	{
		return NO;
	}
	BOOL result = [m_db executeUpdate:sSQL];
	LOGS(@"create table %@ result = %i",sSQL,result);
	[m_db close];
    return result;
}

-(BOOL)deleteAllTable
{
	BOOL bRet = YES;
	// Open database
	if (![m_db open])
	{
		return NO;
	}
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_DELETE_ALL_FROM_TABLE,
                      TableNameAllBookData];
    if (![m_db executeUpdate:sSQL]) {
        bRet = NO;
        LOGS(@"delete %@ fail",TableNameAllBookData);
    }else {
        LOGS(@"delete %@ succeed！",TableNameAllBookData);
    }

    SAFE_RELEASE(sSQL);
    
	sSQL = [[NSString alloc] initWithFormat:SQL_DELETE_ALL_FROM_TABLE,
                      TableNameAllBookMark];
    if (![m_db executeUpdate:sSQL]) {
        bRet = NO;
        LOGS(@"delete %@ fail",TableNameAllBookMark);
    }else {
        LOGS(@"delete %@ succeed！",TableNameAllBookMark);
    }
    
    SAFE_RELEASE(sSQL);

	// Close database
	[m_db close];
	
	return bRet;
}

- (void)deleteBookShelf:(NSString *)bookShelf
{
    // Open database
    if (![m_db open])
    {
        return;
    }
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_BOOKDATA_FROM_TABLE,TableNameAllBookData,@"bookShelf"];
	FMResultSet *rs = [m_db executeQuery:sSQL,bookShelf];
	SAFE_RELEASE(sSQL);
	NSMutableArray *arrBookName = [[NSMutableArray alloc] init];
	while ([rs next])
	{
		[arrBookName addObject:[rs stringForColumn:@"name"]];
	}

    sSQL = [[NSString alloc]initWithFormat:SQL_DELETE_BOOK,@"bookShelf"];
    if ([m_db executeUpdate:sSQL,bookShelf]) {
        LOGS(@"delete book from %@ succeed!",bookShelf);
    }
    SAFE_RELEASE(sSQL);
    sSQL = [[NSString alloc] initWithFormat:SQL_DELETE_BOOKSHELF];
    if ([m_db executeUpdate:sSQL,bookShelf]) {
        LOGS(@"delete %@ succeed!", bookShelf);
    }
    SAFE_RELEASE(sSQL);
    
    for (NSString *name in arrBookName) {
        NSString *path = [[NSString alloc] initWithFormat:@"%@/%@", [[Global sharedGlobal]documentPath],name];
        const char *bookName = [path UTF8String];
        int a = remove(bookName);
        SAFE_RELEASE(path);
        if (a == 0) {
            LOGS(@"delete %@ succeed！",name);
        }else{
            LOGS(@"remove %@ fail",name);
        }
    }
    SAFE_RELEASE(arrBookName);
    // Close database
	[m_db close];
}

- (void)deleteBook:(NSArray *)arrBook;
{
    for (NSUInteger i = 0; i < [arrBook count]; i++) {
        // Open database
        if (![m_db open])
        {
            return;
        }
        NSString *sSQL = [[NSString alloc] initWithFormat:SQL_DELETE_BOOK,@"name"];
        if (![m_db executeUpdate:sSQL,[arrBook objectAtIndex:i]]) {
            LOGS(@"delete %@ fail",[arrBook objectAtIndex:i]);
        }else {
            NSString *name = [[NSString alloc] initWithFormat:@"%@/%@", [[Global sharedGlobal]documentPath],[arrBook objectAtIndex:i]];
            const char *bookName = [name UTF8String];
            int a = remove(bookName);
            SAFE_RELEASE(name);
            if (a == 0) {
                LOGS(@"delete %@ succeed！",[arrBook objectAtIndex:i]);
            }else{
                LOGS(@"remove %@ fail",[arrBook objectAtIndex:i]);
            }
        }
        
        SAFE_RELEASE(sSQL);
        // Close database
        [m_db close];
    }

}


- (void)deleteBookMark:(NSArray *)arrBookMark
{
    for (NSUInteger i = 0; i < [arrBookMark count]; i++) {
        // Open database
        if (![m_db open])
        {
            return;
        }
        NSString *sSQL = [[NSString alloc] initWithFormat:SQL_DELETE_BOOKMARK];
        if (![m_db executeUpdate:sSQL,[arrBookMark objectAtIndex:i]]) {
            LOGS(@"delete %@ fail",[arrBookMark objectAtIndex:i]);
        }else {
            LOGS(@"delete %@ succeed！",[arrBookMark objectAtIndex:i]);
        }
        
        SAFE_RELEASE(sSQL);
    }
}


- (void)updataLastRead:(NSDictionary *)dicLastRead
{
    NSString * sSQL = nil;
    if (![m_db open])
	{
		return;
	}
    LOGS(@"%@", dicLastRead);
    sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_LASTREAD_INTO_TABLE,@"lastReadTime"];
    [m_db executeUpdate: sSQL ,[dicLastRead objectForKey:@"lastReadTime"],
     [dicLastRead objectForKey:@"name"]];
    
         SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];
    
    if (![m_db open])
	{
		return;
	}
    
    sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_LASTREAD_INTO_TABLE,@"lastReadOffset"];
    [m_db executeUpdate: sSQL ,[dicLastRead objectForKey:@"lastReadOffset"],
     [dicLastRead objectForKey:@"name"]];
    
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];
    if (![m_db open])
	{
		return;
	}
    
    sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_LASTREAD_INTO_TABLE,@"fontSize"];
     [m_db executeUpdate: sSQL ,[dicLastRead objectForKey:@"fontSize"],
     [dicLastRead objectForKey:@"name"]];
    
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];
    
}



- (void)updata:(NSString *)bookName bookshelf:(NSString *)bookshelf
{
    if (![m_db open])
	{
		return;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_BOOKSHELF_INTO_TABLE];
    [m_db executeUpdate: sSQL ,bookshelf,bookName];	
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];

}

- (void)updataBookName:(NSString *)oldName newName:(NSString *)newName
{
    if (![m_db open])
	{
		return;
	}
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_LASTREAD_INTO_TABLE,@"name"];
    [m_db executeUpdate: sSQL ,newName,oldName];	
    SAFE_RELEASE(sSQL);
    // Close database
    
	[m_db close];

    NSString *oldPath = [[NSString alloc] initWithFormat:@"%@/%@",[[Global sharedGlobal]documentPath],oldName];
    NSString *newPath = [[NSString alloc] initWithFormat:@"%@/%@",[[Global sharedGlobal]documentPath],newName];
    const char *old = [oldPath UTF8String];
    const char *new = [newPath UTF8String];
    int i = rename(old , new);
    SAFE_RELEASE(oldPath);
    SAFE_RELEASE(newPath);
    LOGS(@"%d", i);
}

- (void)updata:(NSString *)attribute value:(NSString *)value
{
    if (![m_db open])
	{
		return;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_APPSET_INTO_TABLE,attribute];
    [m_db executeUpdate: sSQL ,value,@"greenBerryReader"];
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];

}

- (void)updata:(NSString *)userName password:(NSString *)password
{
    if (![m_db open])
	{
		return;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_APPSET_INTO_TABLE,@"userName"];
    [m_db executeUpdate: sSQL ,userName,@"greenBerryReader"];
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];
    
    if (![m_db open])
	{
		return;
	}
    
    sSQL = [[NSString alloc] initWithFormat:SQL_UPDATA_APPSET_INTO_TABLE,@"password"];
    [m_db executeUpdate: sSQL ,password,@"greenBerryReader"];
    SAFE_RELEASE(sSQL);
    // Close database
	[m_db close];

}

- (BOOL)queryDataIfExist:(NSString *)name tableName:(NSString*)tableName
{
	BOOL bRet = NO;
	// Open database
	if (![m_db open])
	{
		return bRet;
	}
	
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_DATA_IF_EXIST, tableName, @"name"];
	FMResultSet *rs = [m_db executeQuery:sSQL, name];
	SAFE_RELEASE(sSQL);
	while ([rs next])
	{
		NSString * m_name = [rs stringForColumn:@"name"];
		if ([m_name isEqualToString:name]) 
		{
			bRet = YES;
			break;
		}
	}
	// Close database
	[m_db close];
	return bRet;	
}

- (BOOL)queryBookMarkIfExist:(NSString *)bookMark tableName:(NSString*)tableName
{
	BOOL bRet = NO;
	// Open database
	if (![m_db open])
	{
		return bRet;
	}
	
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_DATA_IF_EXIST, tableName, @"id"];
	FMResultSet *rs = [m_db executeQuery:sSQL, bookMark];
	SAFE_RELEASE(sSQL);
	while ([rs next])
	{
		NSString * m_bookMark = [rs stringForColumn:@"id"];
		if ([m_bookMark isEqualToString:bookMark]) 
		{
			bRet = YES;
			break;
		}
	}
	// Close database
	[m_db close];
	return bRet;	
}

- (BOOL)queryAPPSetIfExist:(NSString *)APPName tableName:(NSString*)tableName
{
	BOOL bRet = NO;
	// Open database
	if (![m_db open])
	{
		return bRet;
	}
	
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_DATA_IF_EXIST, tableName, @"APPName"];
	FMResultSet *rs = [m_db executeQuery:sSQL, APPName];
	SAFE_RELEASE(sSQL);
	while ([rs next])
	{
		NSString *m_APPName = [rs stringForColumn:@"APPName"];
		if ([m_APPName isEqualToString:APPName]) 
		{
			bRet = YES;
			break;
		}
	}
	// Close database
	[m_db close];
	return bRet;	
}

- (BOOL)queryBookShelfIfExist:(NSString *)bookShelf tableName:(NSString*)tableName
{
	BOOL bRet = NO;
	// Open database
	if (![m_db open])
	{
		return bRet;
	}
	
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_DATA_IF_EXIST, tableName, @"bookShelf"];
	FMResultSet *rs = [m_db executeQuery:sSQL, bookShelf];
	SAFE_RELEASE(sSQL);
	while ([rs next])
	{
		NSString *m_bookShelf = [rs stringForColumn:@"bookShelf"];
		if ([m_bookShelf isEqualToString:bookShelf]) 
		{
			bRet = YES;
			break;
		}
	}
	// Close database
	[m_db close];
	return bRet;	
}


- (void)insertBookData:(NSArray *)arrBookData
{
    
    BOOL bAlreadyExist;
    NSString *sSQL = nil;
    for (NSUInteger i = 0; i < [arrBookData count]; i++) {
        bAlreadyExist = [self queryDataIfExist:[arrBookData objectAtIndex:i] tableName:TableNameAllBookData];
        if (YES == bAlreadyExist)
        {
            LOGS(@"Metadata:%@ already exists in the table:%@", [arrBookData objectAtIndex:i], TableNameAllBookData);
            continue;
        }
        if (![m_db open])
        {
            return;
        }
        sSQL = [[NSString alloc] initWithFormat:SQL_INSERT_BOOKDATA_INTO_TABLE,
                          TableNameAllBookData,
                          @"name,lastReadTime,lastReadOffset,fontSize,bookShelf"];
        [m_db executeUpdate: sSQL ,
         [arrBookData objectAtIndex:i],
         @"0",
         @"0",
         @"20",
         @"默认书架"];		
        
        SAFE_RELEASE(sSQL);
        // Close database
        [m_db close];
    }
    
	
}


- (void)insertBookMark:(NSDictionary *)dicBookMark
{
    BOOL bAlreadyExist;
    bAlreadyExist = [self queryBookMarkIfExist:[dicBookMark objectForKey:@"id"] tableName:TableNameAllBookMark];
    if (YES == bAlreadyExist)
    {
        LOGS(@"bookmark:%@ already exists in the table:%@", [dicBookMark objectForKey:@"id"], TableNameAllBookMark);
        return;
    }
    
    if (![m_db open])
	{
		return;
	}

    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_INSERT_BOOKMARK_INTO_TABLE,
                      TableNameAllBookMark,
                      @"id,name,offset,fontSize"];
    [m_db executeUpdate: sSQL ,
     [dicBookMark objectForKey:@"id"],
     [dicBookMark objectForKey:@"name"],
     [dicBookMark objectForKey:@"offset"],
     [dicBookMark objectForKey:@"fontSize"]];		
    
    SAFE_RELEASE(sSQL);
        
    
    // Close database
	[m_db close];
	
}

- (void)insertAPPSet
{
    BOOL bAlreadyExist;
    NSString *APPName = [NSString stringWithString:@"greenBerryReader"];
    bAlreadyExist = [self queryAPPSetIfExist:APPName tableName:TableNameAPPSet];
    if (YES == bAlreadyExist)
    {
        LOGS(@"bookmark:%@ already exists in the table:%@",APPName, TableNameAPPSet);
        return;
    }

    
    if (![m_db open])
	{
		return;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_INSERT_APPSET_INTO_TABLE,
                      TableNameAPPSet,
                      @"APPName,isOpenStartupLoge,skinName,isLeachBlankRow,isAutoTransverse,isTurnPagePreservingOneRow,userName,password,defaultAddress"];
    [m_db executeUpdate: sSQL ,
     @"greenBerryReader",
     @"1",
     @"书签1",
     @"1",
     @"1",
     @"1",
     @"",
     @"",
     @""];		
    
    SAFE_RELEASE(sSQL);
    
    
    // Close database
	[m_db close];

}

- (void)insertBookShelf:(NSString *)bookShelf
{
    
    BOOL bAlreadyExist;
    bAlreadyExist = [self queryBookShelfIfExist:bookShelf tableName:TableNameBookShelf];
    if (YES == bAlreadyExist)
    {
        LOGS(@"bookmark:%@ already exists in the table:%@",bookShelf, TableNameBookShelf);
        return;
    }
    
    
    if (![m_db open])
	{
		return;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_INSERT_BOOKSHELF_INTO_TABLE,
                      TableNameBookShelf,
                      @"bookShelf"];
    [m_db executeUpdate: sSQL ,bookShelf];		
    
    SAFE_RELEASE(sSQL);
    
    
    // Close database
	[m_db close];

}

- (NSArray *)queryOneBookDataFromTable:(NSString *)bookName
{
	// Open database
	if (![m_db open])
	{
		return nil;
	}
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_BOOKDATA_FROM_TABLE,TableNameAllBookData,@"name"];
	FMResultSet *rs = [m_db executeQuery:sSQL,bookName];
	SAFE_RELEASE(sSQL);
	NSMutableArray *arrBookData = [[NSMutableArray alloc] init];
	while ([rs next])
	{
		NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [rs stringForColumn:@"name"],@"name",
                             [rs stringForColumn:@"lastReadTime"],@"lastReadTime",
                             [rs stringForColumn:@"lastReadOffset"],@"lastReadOffset",
                             [rs stringForColumn:@"fontSize"],@"fontSize",
                             [rs stringForColumn:@"bookShelf"],@"bookShelf",nil];
		[arrBookData addObject:dic];
		[dic release];
	}
	// Close database
	[m_db close];
    //	LOGS(@"queryDataFromTable:%@",[[arrBookData objectAtIndex:0] objectAtIndex:0]);
	return (NSArray *)[arrBookData autorelease];
	//	return arrBookData;
}

- (NSDictionary *)queryBookByBookshelfFromTable
{
    // Open database
	if (![m_db open])
	{
		return nil;
	}
    
    NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_BOOKSHELF_FROM_TABLE];
	FMResultSet *rs = [m_db executeQuery:sSQL];
	SAFE_RELEASE(sSQL);
	NSMutableDictionary *dicBookshelf = [[NSMutableDictionary alloc] init];
	while ([rs next])
	{        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [dicBookshelf setObject:arr forKey:[rs stringForColumn:@"bookShelf"]];
        SAFE_RELEASE(arr);
	}

    
    sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_ALL_FROM_TABLE,TableNameAllBookData];
    rs = [m_db executeQuery:sSQL];
	SAFE_RELEASE(sSQL);
	while ([rs next])
	{
		NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [rs stringForColumn:@"name"],@"name",
                             [rs stringForColumn:@"lastReadTime"],@"lastReadTime",
                             [rs stringForColumn:@"lastReadOffset"],@"lastReadOffset",
                             [rs stringForColumn:@"fontSize"],@"fontSize",
                             [rs stringForColumn:@"bookShelf"],@"bookShelf",nil];
       
        [[dicBookshelf objectForKey:[rs stringForColumn:@"bookShelf"]] addObject:dic];
        SAFE_RELEASE(dic);
        
	}
	// Close database
	[m_db close];
    LOGS(@"%@",dicBookshelf);
	return (NSDictionary *)[dicBookshelf autorelease];	
	//	return dicBookshelf;
}


- (NSDictionary *)queryAPPSetFromTable
{
	// Open database
	if (![m_db open])
	{
		return nil;
	}
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_APPSET_FROM_TABLE];
	FMResultSet *rs = [m_db executeQuery:sSQL,@"greenBerryReader"];
	SAFE_RELEASE(sSQL);
    NSDictionary *dicAPPSet = nil;
    while ([rs next])
    {
        dicAPPSet = [[[NSDictionary alloc] initWithObjectsAndKeys:
                     [rs stringForColumn:@"APPName"],@"APPName",
                     [rs stringForColumn:@"isOpenStartupLoge"],@"isOpenStartupLoge",
                     [rs stringForColumn:@"skinName"],@"skinName",
                     [rs stringForColumn:@"isLeachBlankRow"],@"isLeachBlankRow",
                     [rs stringForColumn:@"isAutoTransverse"],@"isAutoTransverse",
                     [rs stringForColumn:@"isTurnPagePreservingOneRow"],@"isTurnPagePreservingOneRow",
                     [rs stringForColumn:@"userName"],@"userName",
                     [rs stringForColumn:@"password"],@"password",
                     [rs stringForColumn:@"defaultAddress"],@"defaultAddress",nil] autorelease];
    }
	// Close database
	[m_db close];
    LOGS(@"APPSet = %@",dicAPPSet);
	return (NSDictionary *)dicAPPSet;	
	//	return dicBookshelf;
}


- (NSArray *)queryBookDataFromTable
{
	// Open database
	if (![m_db open])
	{
		return nil;
	}
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_ALL_FROM_TABLE,TableNameAllBookData];
	FMResultSet *rs = [m_db executeQuery:sSQL];
	SAFE_RELEASE(sSQL);
	NSMutableArray *arrBookData = [[NSMutableArray alloc] init];
	while ([rs next])
	{
		NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
						[rs stringForColumn:@"name"],@"name",
						[rs stringForColumn:@"lastReadTime"],@"lastReadTime",
						[rs stringForColumn:@"lastReadOffset"],@"lastReadOffset",
                        [rs stringForColumn:@"fontSize"],@"fontSize",
						[rs stringForColumn:@"bookShelf"],@"bookShelf",nil];
		[arrBookData addObject:dic];
		[dic release];
	}
	// Close database
	[m_db close];
//	LOGS(@"queryDataFromTable:%@",[[arrBookData objectAtIndex:0] objectAtIndex:0]);
	return (NSArray *)[arrBookData autorelease];	
	//	return arrBookData;
}

- (NSArray *)queryBookMarkFromTable
{
	// Open database
	if (![m_db open])
	{
		return nil;
	}
	NSString *sSQL = [[NSString alloc] initWithFormat:SQL_QUERY_ALL_FROM_TABLE,TableNameAllBookMark];
	FMResultSet *rs = [m_db executeQuery:sSQL];
	SAFE_RELEASE(sSQL);
	NSMutableArray *arrBookMark = [[NSMutableArray alloc] init];
	while ([rs next])
	{
		NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [rs stringForColumn:@"id"],@"id",
                             [rs stringForColumn:@"name"],@"name",
                             [rs stringForColumn:@"offset"],@"offset",
                             [rs stringForColumn:@"fontSize"],@"fontSize",nil];

		[arrBookMark addObject:dic];
		[dic release];
	}
	// Close database
	[m_db close];
    //	LOGS(@"queryDataFromTable:%@",[[arrBookData objectAtIndex:0] objectAtIndex:0]);
	return (NSArray *)[arrBookMark autorelease];	
	//	return arrBookData;
}


@end
