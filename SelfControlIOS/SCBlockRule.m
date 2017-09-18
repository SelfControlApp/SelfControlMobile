//
//  SCBlockRule.m
//  SelfControlIOS
//
//  Created by Charles Stigler on 25/02/2017.
//  Copyright © 2017 SelfControl. All rights reserved.
//

#import "SCBlockRule.h"

NS_ASSUME_NONNULL_BEGIN

NSString *SCBlockRuleFilterActionGetDescription(SCBlockRuleFilterAction action) {
    switch (action) {
    case SCBlockRuleFilterActionBlock: return @"Block";
    case SCBlockRuleFilterActionExamineData: return @"Examine Data";
    case SCBlockRuleFilterActionNeedMoreRulesAndAllow: return @"Ask for more rules, then allow";
    case SCBlockRuleFilterActionNeedMoreRulesAndBlock: return @"Ask for more rules, then block";
    case SCBlockRuleFilterActionNeedMoreRulesFromDataAndAllow: return @"Ask for more rules, examine data, then allow";
    case SCBlockRuleFilterActionNeedMoreRulesFromDataAndBlock: return @"Ask for more rules, examine data, then block";
    case SCBlockRuleFilterActionRedirectToSafeURL: return @"Redirect";
    case SCBlockRuleFilterActionRemediate: return @"Remediate";
    case SCBlockRuleFilterActionAllow: return @"Allow";
    }
}

@implementation SCBlockRule

+ (instancetype)ruleWithHostname:(NSString *)hostname {
    return [[SCBlockRule alloc] initWithHostname: hostname];
}

- (instancetype)initWithHostname:(NSString *)hostname {
    self = [super init];
    if (!self)
        return nil;
    
    _hostname = [hostname copy];
    _type = @"hostname";
    _appDict = [NSDictionary dictionary];
    
    return self;
}

+ (instancetype)ruleWithAppDict:(NSDictionary *)appDict {
    return [[SCBlockRule alloc] initWithAppDict: appDict];
}

- (instancetype)initWithAppDict:(NSDictionary *)appDict {
    self = [super init];
    if (!self)
        return nil;
    
    _appDict = [appDict copy];
    _type = @"app";
    
    return self;
}

- (NSDictionary *)filterRuleDictionary {
    return @{
            @"kRule": @(SCBlockRuleFilterActionBlock),
            @"kRemediationKey": @"Remediate1",
            @"type": self.type,
            @"appDict": self.appDict
            };
}

@end

NS_ASSUME_NONNULL_END

