//
//  Task.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property NSString *name;
@property NSString *description;
@property NSString *priority;
@property NSString *status;
@property NSString *storedDate;

@end

NS_ASSUME_NONNULL_END
