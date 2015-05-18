//
//  UserDescription.h
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDescription : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *user_name;
@property (weak, nonatomic) IBOutlet UITextField *user_age;
@property (weak, nonatomic) IBOutlet UITextField *user_email;
@property (weak, nonatomic) IBOutlet UITextField *user_pass;

@property (weak, nonatomic) NSString *str_name;

@property (nonatomic) NSInteger *num;


- (IBAction)updateButton:(id)sender;
- (IBAction)enableEdetingButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *updateButtonOutlet;

@end
