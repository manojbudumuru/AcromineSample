//
//  AFNetworkManager.h
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AFNetworkManagerDelegate <NSObject>

-(void) getResponseData:(NSDictionary*) responseData;

@end

@interface AFNetworkManager : NSObject
@property (nonatomic,weak) id<AFNetworkManagerDelegate> networkResponseDelegate;
-(void) sendGetRequest:(NSString *)url inputParameters:(NSDictionary*)params;
@end
