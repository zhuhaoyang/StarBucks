//
//  PublicDefine.h
//  excel
//
//  Created by zhuhaoyang on 11-11-8.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// Log Print  on->1  off->0
#define LOG_STATE 1

#if LOG_STATE
#define LOGS(msg1, ...) NSLog(msg1, ##__VA_ARGS__)
#else
#define LOGS(msg1, ...)
#endif

// Safe Release
#define SAFE_RELEASE(object)\
{\
if (nil != object)\
{\
[object release];\
object = nil;\
}\
}


// Time out setting for Http engine
#define kTimeOutDuration 20


#define TableNameAllBookData @"AllBookData_Table"
#define TableNameAllBookMark @"AllBookMark_Table"
#define TableNameAPPSet @"APPSet_Table"
#define TableNameBookShelf @"BookShelf_Table"

#define kTableFormatAllBookData @"name text, lastReadTime text, lastReadOffset text, fontSize text, bookShelf text"
#define kTableFormatAllBookMark @"id text, name text, offset text, fontSize text"
#define kTableFormatAPPSet @"APPName text, isOpenStartupLoge text, skinName text, isLeachBlankRow text, isAutoTransverse text,isTurnPagePreservingOneRow, userName text, password text, defaultAddress text"
#define kTableFormatBookShelf @"bookShelf text"

#define SQL_CREATE_TABLE @"CREATE TABLE %@ (%@)"// Table Name, Table Format

#define SQL_DELETE_ALL_FROM_TABLE @"DELETE FROM %@"// Table Name
#define SQL_DELETE_BOOKSHELF @"DELETE FROM BookShelf_Table WHERE bookShelf = ?"
#define SQL_DELETE_BOOK @"DELETE FROM AllBookData_Table WHERE %@ = ?"
#define SQL_DELETE_BOOKMARK @"DELETE FROM AllBookMark_Table WHERE id = ?"

#define SQL_QUERY_DATA_IF_EXIST @"SELECT * FROM %@ WHERE %@ = ?"// Table Name, attribute name
#define SQL_QUERY_ALL_FROM_TABLE @"SELECT * FROM %@"// Table Name
#define SQL_QUERY_BOOKDATA_FROM_TABLE @"SELECT * FROM %@ WHERE %@ = ?"// Table Name, attribute name
#define SQL_QUERY_APPSET_FROM_TABLE @"SELECT * FROM APPSet_Table WHERE APPName = ?"
#define SQL_QUERY_BOOKSHELF_FROM_TABLE @"SELECT * FROM BookShelf_Table"


#define SQL_INSERT_BOOKDATA_INTO_TABLE @"INSERT INTO %@ (%@) VALUES (?,?,?,?,?)"// Table Name, attribute name
#define SQL_INSERT_BOOKMARK_INTO_TABLE @"INSERT INTO %@ (%@) VALUES (?,?,?,?)"// Table Name, attribute name
#define SQL_INSERT_APPSET_INTO_TABLE @"INSERT INTO %@ (%@) VALUES (?,?,?,?,?,?,?,?,?)"// Table Name, attribute name
#define SQL_INSERT_BOOKSHELF_INTO_TABLE @"INSERT INTO %@ (%@) VALUES (?)"// Table Name, attribute name

#define SQL_UPDATA_LASTREAD_INTO_TABLE @"UPDATE AllBookData_Table SET %@ = ? WHERE name = ?"
#define SQL_UPDATA_BOOKSHELF_INTO_TABLE @"UPDATE AllBookData_Table SET bookShelf = ? WHERE name = ?"
#define SQL_UPDATA_APPSET_INTO_TABLE @"UPDATE APPSet_Table SET %@ = ? WHERE APPName = ?"
