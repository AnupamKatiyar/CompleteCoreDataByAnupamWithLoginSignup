//
//  ViewController.h
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import "AppDelegate.h"

@interface Database_Helper : NSObject

@property (nonatomic, weak) AppDelegate *appDelegate;

-(void) writeDataToDatabase:(NSString*)name age:(NSString*)age email:(NSString*)email password:(NSString*)pass;


-(id) readDataFromDatabase ;  // here 'id' is a type of generic array 

-(id) ReadConditionalData:(NSString*)username age:(NSString*)age email:(NSString*)email;

-(void) UpdateData_Name:(NSString*)name age:(NSString*)age email:(NSString*)email password:(NSString*)pass oldName:(NSString*)oldName;

-(void) deleteDataFromDatabase;

-(void) deleteConditionalDataFromDatabaseName:(NSString*)name age:(NSString*)age email:(NSString*)email;

-(NSInteger) logInDataName:(NSString*)username password:(NSString*)password;


@end

