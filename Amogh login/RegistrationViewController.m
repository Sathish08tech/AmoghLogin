//
//  RegistrationViewController.m
//  Amogh login
//
//  Created by Amogh on 22/02/16.
//  Copyright © 2016 Amogh. All rights reserved.
//

#import "RegistrationViewController.h"
#import <CoreData/CoreData.h>

@interface RegistrationViewController ()



@end

@implementation RegistrationViewController

-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signup:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [user setValue:self.nameTxtField.text forKey:@"name"];
    [user setValue:self.emailTxtField.text forKey:@"email"];
    [user setValue:self.addressTxtField.text forKey:@"address"];
    
    NSError *error = nil;
    [context save:&error];
    NSLog(@"Data Saved");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

@end














