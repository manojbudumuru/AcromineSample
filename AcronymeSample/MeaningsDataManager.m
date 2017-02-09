//
//  MeaningsDataManager.m
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//

#import "MeaningsDataManager.h"

@implementation MeaningsDataManager
+ (instancetype) sharedManager
{
    static dispatch_once_t once;
    static MeaningsDataManager* sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        
        
    });
    return sharedInstance;
}
-(instancetype) init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

@end
