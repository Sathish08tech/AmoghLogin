//
//  ViewController.m
//  Amogh login
//
//  Created by Amogh on 14/02/16.
//  Copyright (c) 2016 Amogh. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtFld;
@property (nonatomic, strong) NSMutableArray *userInfo;

- (IBAction)signPressed:(id)sender;

@end

@implementation ViewController

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
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    self.userNameTxtFld.delegate = self;
    self.passwordTxtFld.delegate = self;
}

//Text Fields delegate methods:

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signPressed:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.userInfo = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSLog(@"%@", self.userInfo);
}
@end
