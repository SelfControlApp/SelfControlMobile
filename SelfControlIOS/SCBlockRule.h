//
//  SCBlockRule.h
//  SelfControlIOS
//
//  Created by Charles Stigler on 25/02/2017.
//  Copyright © 2017 SelfControl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SCBlockRuleFilterAction) {
    SCBlockRuleFilterActionBlock,
    SCBlockRuleFilterActionAllow,
    SCBlockRuleFilterActionNeedMoreRulesAndBlock,
    SCBlockRuleFilterActionNeedMoreRulesAndAllow,
    SCBlockRuleFilterActionNeedMoreRulesFromDataAndBlock,
    SCBlockRuleFilterActionNeedMoreRulesFromDataAndAllow,
    SCBlockRuleFilterActionExamineData,
    SCBlockRuleFilterActionRedirectToSafeURL,
    SCBlockRuleFilterActionRemediate
};

typedef NS_ENUM(NSInteger, SCBlockType) {
    SCBlockTypeApp,
    SCBlockTypeHost
};

extern NSString *SCBlockRuleFilterActionGetDescription(SCBlockRuleFilterAction action);

@interface SCBlockRule : NSObject

- (instancetype)initWithHostname:(NSString *)hostname;
+ (instancetype)ruleWithHostname:(NSString*) hostname;

+ (instancetype)ruleWithAppDict:(NSDictionary *)appDict;
- (instancetype)initWithAppDict:(NSDictionary *)appDict;

@property (nonatomic, readonly) NSString* type;
@property (nonatomic, readonly) NSString *hostname;
@property (nonatomic, readonly) NSDictionary* appDict;

- (NSDictionary *)filterRuleDictionary;

@end

NS_ASSUME_NONNULL_END
