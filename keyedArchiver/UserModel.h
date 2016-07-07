//
//  UserModel.h
//  keyedArchiver
//
//  Created by beginner on 16/7/7.
//  Copyright © 2016年 beginner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBModel.h"

@interface UserModel : ZBModel
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *telNumber;

- (UserModel *)initWithDictionary:(NSDictionary *)dic;
- (void)saveUserModelInLocationPath;
- (UserModel *)getUserModelInLocationPath;
@end
