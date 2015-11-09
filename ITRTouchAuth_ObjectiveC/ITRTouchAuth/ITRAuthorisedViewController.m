//
//  ITRAuthorisedViewController.m
//  ITRTouchAuth
//
//  Created by kiruthika selvavinayagam on 11/9/15.
//  Copyright © 2015 kiruthika selvavinayagam. All rights reserved.
//

#import "ITRAuthorisedViewController.h"

@interface ITRAuthorisedViewController ()

@end

@implementation ITRAuthorisedViewController

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissClicked)]];
}
                                                                     
#pragma mark - selector
- (void) dismissClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}
                                                                     
                                                                    

@end
