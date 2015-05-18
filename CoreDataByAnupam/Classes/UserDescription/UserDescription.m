//
//  UserDescription.m
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import "UserDescription.h"
#import "Database_Helper.h"
#import "TableNo1.h"

@interface UserDescription ()

@end

@implementation UserDescription

Database_Helper *db;
NSMutableArray *userData;
NSString *oldName;


#pragma mark -
#pragma mark - View Controller lifeCycle methods.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    db = [[Database_Helper alloc]init];
    userData = [[NSMutableArray alloc]init];
   
    // type 1 by cell location
    
//    NSLog(@"cellnumnber %ld",(long)_num);
//    userData = [db readDataFromDatabase];
//    TableNo1 * object = [userData objectAtIndex:(long)_num];
    
    
    // type 2 by user name
    
    
    NSLog(@"cellnumnber %@",_str_name);
    userData = [[db ReadConditionalData:_str_name age:nil email:nil] copy];
    TableNo1 * object = [userData objectAtIndex:0];

    
    // display on view
    
    _user_name.text = object.name;
    _user_age.text = object.age;
    _user_email.text = object.email;
    _user_pass.text = object.password;
    
    oldName = object.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark - IBActiom methods.

- (IBAction)updateButton:(id)sender {
    
    [db UpdateData_Name:_user_name.text age:_user_age.text email:_user_email.text password:_user_pass.text oldName:oldName];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Update Sucess" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    });

    
    [_updateButtonOutlet setEnabled:false];

}



- (IBAction)enableEdetingButton:(id)sender {
    
    [_updateButtonOutlet setEnabled:true];
    
    [_user_name setUserInteractionEnabled:true];
    [_user_age setUserInteractionEnabled:true];
    [_user_email setUserInteractionEnabled:true];
    [_user_pass setUserInteractionEnabled:true];
    
    
}
@end
