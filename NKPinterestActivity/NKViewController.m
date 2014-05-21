//
//  NKViewController.m
//  NKPinterestActivity
//
//  Created by Neil Kimmett on 21/05/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

#import "NKViewController.h"
#import "NKPinterestActivity.h"

@implementation NKViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSURL *imageURL = [NSURL URLWithString:@"http://www.monumentalmayhem.com/wp-content/uploads/2014/04/210.jpg"];
    NSURL *sourceURL = [NSURL URLWithString:@"http://www.cookwithmands.com"];
    NKPinterestActivity *pinterestActivity = [[NKPinterestActivity alloc] initWithClientId:@"1437921" imageURL:imageURL];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[sourceURL, @"kittenz!"] applicationActivities:@[pinterestActivity]];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
