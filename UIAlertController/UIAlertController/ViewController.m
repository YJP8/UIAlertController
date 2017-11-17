//
//  ViewController.m
//  UIAlertController
//
//  Created by Levante on 2017/11/17.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark FirstButton

- (IBAction)buttonFirstClick:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark SecondButton

- (IBAction)buttonSecondClick:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:  UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"account";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"password";
        textField.secureTextEntry = YES;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        for (UITextField *textField in alert.textFields) {
            NSLog(@"textFIeld = %@", textField.text);
        }
    }]];
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark ThirdButton

- (IBAction)buttonThirdClick:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:nil preferredStyle:  UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:true completion:nil];
}
@end
