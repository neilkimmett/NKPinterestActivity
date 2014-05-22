//
//  NKPinterestActivity.m
//  NKPinterestActivity
//
//  Created by Neil Kimmett on 21/05/2014.
//  Copyright (c) 2014 Neil Kimmett. All rights reserved.
//

#import "NKPinterestActivity.h"
#import "Pinterest.h"

@interface NKPinterestActivity ()
@property (nonatomic, strong) Pinterest *pinterest;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSURL *sourceURL;
@property (nonatomic, strong) NSString *description;
@end

@implementation NKPinterestActivity

- (instancetype)initWithClientId:(NSString *)clientId imageURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {
        NSParameterAssert(clientId);
        NSParameterAssert(imageURL);
        _pinterest = [[Pinterest alloc] initWithClientId:clientId];
        _imageURL = imageURL;
    }
    return self;
}

#pragma mark - UIActivity
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    BOOL hasURL = NO;
    for (id item in activityItems) {
        if([item isKindOfClass:[NSURL class]]) {
            hasURL = YES;
            break;
        }
    }
    return hasURL;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for(id item in activityItems) {
        if([item isKindOfClass:[NSURL class]]){
            self.sourceURL = item;
        }
        else if ([item isKindOfClass:[NSString class]]) {
            self.description = item;
        }
    }
}

- (void)performActivity
{
    if ([self.pinterest canPinWithSDK]) {
        [self pinUsingPinterestSDK];
    }
    else {
        [self pinUsingBrowser];
    }
    
    [self activityDidFinish:YES];
}

- (void)pinUsingPinterestSDK
{
    [self.pinterest createPinWithImageURL:self.imageURL
                                sourceURL:self.sourceURL
                              description:self.description];
}

- (void)pinUsingBrowser
{
    NSString *baseURLFormat = @"http://www.pinterest.com/pin/create/button/?url=%@&media=%@&description=%@";
    NSString *mediaURL = NKURLEncodedStringFromURL(self.sourceURL);
    NSString *imageURL = NKURLEncodedStringFromURL(self.imageURL);
    NSString *description = NKURLEncodedStringFromString(self.description);
    NSString *fullString = [NSString stringWithFormat:baseURLFormat, mediaURL, imageURL, description];
    NSURL *url = [NSURL URLWithString:fullString];
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - URL encoding
static NSString * NKURLEncodedStringFromURL(NSURL *url)
{
    NSString *absoluteString = [url absoluteString];
    return NKURLEncodedStringFromString(absoluteString);
}

static NSString * NKURLEncodedStringFromString(NSString *string)
{
    NSString *encoded = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)string, NULL, CFSTR("!$&'()*+,-./:;=?@_~"), kCFStringEncodingUTF8);
    return encoded;
}

#pragma mark - UIActivity bookkeeping
- (NSString *)activityType
{
	return NSStringFromClass([self class]);
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:self.activityType];
}

- (NSString *)activityTitle
{
    return @"Pinterest";
}

+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

@end
