//
//  ViewController.m
//  ITRTouchAuth
//
//  Created by kiruthika selvavinayagam on 11/9/15.
//  Copyright © 2015 kiruthika selvavinayagam. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()
@end

@implementation ViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - event
- (IBAction)authoriseClicked:(id)sender {
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Authentication needed to allow to view other screen";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    // User authenticated successfully, take appropriate action
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ITRAuthorisedViewController"]] animated:YES completion:nil];
                                    });
                                } else {
                                    // User did not authenticate successfully, look at error and take appropriate action
                                    
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                       [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
                                    });
                                    
                                }
                            }];
    } else {
        // Could not evaluate policy; look at authError and present an appropriate message to user
        [[[UIAlertView alloc] initWithTitle:@"Error" message:authError.localizedDescription delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
}

@end
