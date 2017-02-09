//
//  MeaningsJsonParser.m
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//
// can make this as common json parser for any request

#import "MeaningsJsonParser.h"
#import "JsonContsnts.h"
#import "MeaningsDataManager.h"

@implementation MeaningsJsonParser

-(void)jsonData:(NSArray*)jsonData{
    
    NSMutableArray * meeningsArray = [[NSMutableArray alloc]init];
    NSDictionary * jsonDict = jsonData[0];
    [MeaningsDataManager sharedManager].title= [jsonDict valueForKey:Responce_SF];
    NSArray* lsfArray = [jsonDict valueForKey:Responce_lfs];
    for (NSDictionary* meeningsDict in lsfArray) {
        [meeningsArray addObject:[meeningsDict valueForKey:Responce_lf]];
    }
    [MeaningsDataManager sharedManager].meanings= [[NSArray alloc]initWithArray:meeningsArray];
}

@end
