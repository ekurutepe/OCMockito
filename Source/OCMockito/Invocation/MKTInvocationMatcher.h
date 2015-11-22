//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import <Foundation/Foundation.h>

@protocol HCMatcher;


@interface MKTInvocationMatcher : NSObject

@property (nonatomic, strong, readonly) NSInvocation *expected;
@property (nonatomic, assign, readonly) NSUInteger numberOfArguments;

- (instancetype)init;
- (void)setMatcher:(id <HCMatcher>)matcher atIndex:(NSUInteger)index;
- (NSUInteger)argumentMatchersCount;
- (void)setExpectedInvocation:(NSInvocation *)expectedInvocation;
- (BOOL)matches:(NSInvocation *)actual;

@end
