//
//  AFNetworkManager.m
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//

#import "AFNetworkManager.h"
#import "AFHTTPSessionManager.h"
#import "MeaningsJsonParser.h"
#import "MeaningsDataManager.h"

@implementation AFNetworkManager
-(void) sendGetRequest:(NSString *)url inputParameters:(NSDictionary*)params{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = nil;
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject :%@",responseObject);
        NSArray *responseArray = responseObject;
        if (responseArray!=nil && responseArray.count>0) {
            MeaningsJsonParser * jsonParser = [[MeaningsJsonParser alloc]init];
            [jsonParser jsonData:responseArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_networkResponseDelegate getResponseData:nil];
            });
        }else{
            [MeaningsDataManager sharedManager].meanings = nil;
            [MeaningsDataManager sharedManager].errorMSG = @"Please Enter a proper Acronym.";
            [_networkResponseDelegate getResponseData:nil];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error : %@",error);
        [MeaningsDataManager sharedManager].meanings = nil;
        [_networkResponseDelegate getResponseData:nil];
    }];
}
@end
