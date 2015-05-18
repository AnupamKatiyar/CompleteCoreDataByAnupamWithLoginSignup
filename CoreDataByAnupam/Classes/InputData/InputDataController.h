//
//  InputDataController.h
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputDataController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *user_name;
@property (weak, nonatomic) IBOutlet UITextField *user_age;
@property (weak, nonatomic) IBOutlet UITextField *user_email;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;


- (IBAction)saveData:(id)sender;


@end
