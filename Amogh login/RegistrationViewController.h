//
//  RegistrationViewController.h
//  Amogh login
//
//  Created by Amogh on 22/02/16.
//  Copyright © 2016 Amogh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *emailTxtField;
@property (weak, nonatomic) IBOutlet UITextField *addressTxtField;

- (IBAction)signup:(id)sender;

@end
