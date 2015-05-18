//
//  ViewController.m
//  CoreDataByAnupam
//
//  Created by Anupam Katiyar on 01/04/15.
//  Copyright (c) 2015 AppInventive. All rights reserved.
//

#import "Database_Helper.h"
#include "TableNo1.h"

@interface Database_Helper ()
@end


@implementation Database_Helper

@synthesize appDelegate;

- (id)init{
    appDelegate = [[UIApplication sharedApplication]delegate];
    return [super init];
}

#pragma mark -
#pragma mark - Database methods

-(void) writeDataToDatabase:(NSString*)name age:(NSString*)age email:(NSString*)email password:(NSString*)pass{
    
    TableNo1 *table = nil;
    table = [NSEntityDescription insertNewObjectForEntityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    
    [table setValue:name forKey:@"name"];
    [table setValue:age forKey:@"age"];
    [table setValue:email forKey:@"email"];
    [table setValue:pass forKey:@"password"];

    [self saveData];
}




-(id) readDataFromDatabase{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:entityDescription];
    
    NSError *error;

    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Read all Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        NSLog(@"\n\n ************ all data ************ \n\n");
        
        NSLog(@"name %@",data.name);
        NSLog(@"age %@",data.age);
        NSLog(@"email %@",data.email);
        NSLog(@"password %@",data.password);
    }
    
    return result;
}


-(id) ReadConditionalData:(NSString*)username age:(NSString*)age email:(NSString*)email{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:description];
    
    NSString *condition = [[NSString alloc]initWithFormat:@"name == '%@'",username];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:condition];
    
//    NSString *condition = @"amit";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)",condition];
    
    [request setPredicate:predicate];
    
    NSError *error;
    
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Conditional Read Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        NSLog(@"\n\n ************ conditional data ************ \n\n");
        
        NSLog(@"name %@",data.name);
        NSLog(@"age %@",data.age);
        NSLog(@"email %@",data.email);
        NSLog(@"password %@",data.password);
    }

    return result;
}


-(NSInteger) logInDataName:(NSString*)username password:(NSString*)password{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:description];
    
    NSString *condition = [[NSString alloc]initWithFormat:@"name == '%@' AND password == '%@'",username, password];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:condition];
    
    [request setPredicate:predicate];
    
    NSError *error;
    
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Conditional Read Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        NSLog(@"\n\n ************ conditional data ************ \n\n");
        
        NSLog(@"name %@",data.name);
        NSLog(@"age %@",data.age);
        NSLog(@"email %@",data.email);
        NSLog(@"password %@",data.password);
    }
    
    return [result count];
}



-(void) UpdateData_Name:(NSString*)name age:(NSString*)age email:(NSString*)email password:(NSString*)pass oldName:(NSString*)oldName{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:description];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)", oldName];
    [request setPredicate:predicate];
    
    NSError *error;
    
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    NSLog(@"%lu",(unsigned long)result.count);
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Read all Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        data.name = name;
        data.age = age;
        data.email = email;
        data.password = pass;
        
        NSLog(@"\n\n ************ data Updated ************ \n\n");
    }

    [self saveData];

}


-(void) deleteDataFromDatabase{

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:description];
    
    // delete condition
    
//    NSString *condition = @"Anupam";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)", condition];
//    [request setPredicate:predicate];
    
    NSError *error;
    
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Read all Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        [appDelegate.managedObjectContext deleteObject:data];
        
        NSLog(@"\n\n ************ data deleted ************ \n\n");
    }
    
    [self saveData];
    
}


-(void) deleteConditionalDataFromDatabaseName:(NSString*)name age:(NSString*)age email:(NSString*)email{
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"TableNo1" inManagedObjectContext:appDelegate.managedObjectContext];
    [request setEntity:description];
    
    // delete condition
    
   // NSString *condition = name;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)", name];
    [request setPredicate:predicate];
    
    NSError *error;
    
    NSArray *result = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"error :  %@",error.localizedDescription);
    }else{
        NSLog(@"\n\n Read all Success....... \n\n");
    }
    
    for (TableNo1 *data in result) {
        
        [appDelegate.managedObjectContext deleteObject:data];
        
        NSLog(@"\n\n ************ data deleted ************ \n\n");
    }
    
    [self saveData];
    
}





-(void)saveData{

    NSError *error;
    BOOL isSaved = [appDelegate.managedObjectContext save:&error];
    if (!isSaved) {
        NSLog(@"%@", error.localizedDescription);
    }else{
        NSLog(@"\n\n Saved Success....... \n\n");
    }
    
}



#pragma mark -
#pragma mark - method for getting path.

- (NSURL *)applicationDatabasePath
{
    NSLog(@"%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory  inDomains:NSUserDomainMask] lastObject]);
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
