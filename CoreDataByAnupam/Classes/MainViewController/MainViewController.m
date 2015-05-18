//
//  MainViewController.m
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import "MainViewController.h"
#import "Database_Helper.h"
#import "TableViewCell.h"
#import "TableNo1.h"
#import "UserDescription.h"
#import "InputDataController.h"

@interface MainViewController ()
@end

@implementation MainViewController

Database_Helper *db;
NSMutableArray *userData;
UserDescription *userDescription;  // userdata description class
InputDataController *inputdataClass; // register class
UIAlertView *alert;  //for login

#pragma mark -
#pragma mark - view Controller lifecycle methods

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    userData = [[db readDataFromDatabase] copy];
    [_tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    db = [[Database_Helper alloc]init];
    
    userData = [[NSMutableArray alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark -
#pragma mark - TableView datasource methods.


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [userData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableIdentifier = @"cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    TableNo1 * object = [userData objectAtIndex:indexPath.row];
    
    cell.cellName.text = object.name;
    cell.cellAge.text = object.age;
    cell.cellEmail.text = object.email;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableNo1 * object = [userData objectAtIndex:indexPath.row];
    
    NSLog(@"delete cell name %@",object.name);
    [db deleteConditionalDataFromDatabaseName:object.name age:nil email:nil];
    
    userData = [[db readDataFromDatabase] copy];
    [_tableView reloadData];
    
}

#pragma mark -
#pragma mark - TableView delegate methods.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    alert = [[UIAlertView alloc]initWithTitle:@"login" message:nil delegate:self cancelButtonTitle:@"LogIn" otherButtonTitles:@"SignUp", nil];
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [[alert textFieldAtIndex:1] setSecureTextEntry:NO];
    [alert show];
    
    userDescription = [self.storyboard instantiateViewControllerWithIdentifier:@"userDescription"];
    TableNo1 * object = [userData objectAtIndex:indexPath.row];
    userDescription.str_name = object.name;
    NSLog(@"cellname %@",object.name);
    userDescription.num = (long *)(indexPath.row);
    
//    UserDescription *userDescription = [self.storyboard instantiateViewControllerWithIdentifier:@"userDescription"];
//    TableNo1 * object = [userData objectAtIndex:indexPath.row];
//    userDescription.str_name = object.name;
//    NSLog(@"cellname %@",object.name);
//    userDescription.num = (long *)(indexPath.row);
//    [self.navigationController pushViewController:userDescription animated:true];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


#pragma mark -
#pragma mark - IBAction methods.

- (IBAction)clearDataButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"do you want to clear all data" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"yes", nil];
    [alert show];
}

#pragma mark -
#pragma mark - UIAlertView delegate methods.

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView alertViewStyle] == UIAlertViewStyleLoginAndPasswordInput)
    {
        NSLog(@"Login: %@", [[alert textFieldAtIndex:0] text]);
        NSLog(@"Password: %@", [[alert textFieldAtIndex:1] text]);
        
        switch (buttonIndex) {
            case 0:
            {
                if ([db logInDataName:[[alertView textFieldAtIndex:0] text] password:[[alertView textFieldAtIndex:1] text]]) {
                    [self.navigationController pushViewController:userDescription animated:true];
                }
                else
                {
                    [alertView dismissWithClickedButtonIndex:0 animated:true];

                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Invalid name or password....." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
                    [alert show];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [alert dismissWithClickedButtonIndex:0 animated:YES];
                    });
                    
                }
            }
                break;
                
            case 1:
                
                inputdataClass = [self.storyboard instantiateViewControllerWithIdentifier:@"register"];
                [self.navigationController pushViewController:inputdataClass animated:true];
                
                break;
                
            default:
                break;
        }
        
    }
    
    else
    {
        switch (buttonIndex) {
            case 0:
                [alertView dismissWithClickedButtonIndex:0 animated:true];
                break;
                
            case 1:
                [db deleteDataFromDatabase];
                userData = [[db readDataFromDatabase] copy];
                [_tableView reloadData];
                break;
                
            default:
                break;
        }
    }
}

@end
