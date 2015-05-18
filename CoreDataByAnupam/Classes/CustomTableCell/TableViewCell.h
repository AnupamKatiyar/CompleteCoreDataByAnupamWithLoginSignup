//
//  TableViewCell.h
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellName;
@property (weak, nonatomic) IBOutlet UILabel *cellAge;
@property (weak, nonatomic) IBOutlet UILabel *cellEmail;


@end
