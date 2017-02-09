//
//  MeaningsDataManager.h
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeaningsDataManager : NSObject
+ (instancetype) sharedManager;
@property (nonatomic) NSArray * meanings;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* errorMSG;
@end
