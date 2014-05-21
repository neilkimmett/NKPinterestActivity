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
    
    NSURL *imageURL = [NSURL URLWithString:@"http://placekitten.com/200/300"];
    NSURL *sourceURL = [NSURL URLWithString:@"http://placekitten.com/"];

#warning You'll need to register for your own Pinterest client id here https://developers.pinterest.com/manage/
    NKPinterestActivity *pinterestActivity = [[NKPinterestActivity alloc] initWithClientId:@"1111111" imageURL:imageURL];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[sourceURL, @"Look at the lovely kittens!"]
                                                                             applicationActivities:@[pinterestActivity]];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
