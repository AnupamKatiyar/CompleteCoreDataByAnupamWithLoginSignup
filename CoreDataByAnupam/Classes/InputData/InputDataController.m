//
//  InputDataController.m
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import "InputDataController.h"
#import "Database_Helper.h"


@interface InputDataController ()

@end

@implementation InputDataController

Database_Helper *databaseClass;


#pragma mark -
#pragma mark - view Controller lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    databaseClass = [[Database_Helper alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - IBAction methods

- (IBAction)saveData:(id)sender {
    
    [databaseClass writeDataToDatabase:_user_name.text age:_user_age.text email:_user_email.text password:_userPassword.text];
    [databaseClass readDataFromDatabase];
    
    [self.navigationController popViewControllerAnimated:true];
}

@end
