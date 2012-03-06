//
//  OCMockito - MKTMockitoCore.m
//  Copyright 2011 Jonathan M. Reid. See LICENSE.txt
//

#import "MKTMockitoCore.h"

#import "MKTMockingProgress.h"
#import "MKTVerificationMode.h"


@interface MKTMockitoCore ()
@property (nonatomic, retain) MKTMockingProgress *mockingProgress;
- (MKTOngoingStubbing *)stub;
@end


@implementation MKTMockitoCore

@synthesize mockingProgress;

+ (id)sharedCore
{
    static id sharedCore = nil;

    if (!sharedCore)
        sharedCore = [[self alloc] init];
    return sharedCore;
}

- (id)init
{
    self = [super init];
    if (self)
        mockingProgress = [[MKTMockingProgress sharedProgress] retain];
    return self;
}

- (void)dealloc
{
    [mockingProgress release];
    [super dealloc];
}

- (MKTOngoingStubbing *)stubAtLocation:(MKTTestLocation)location
{
    [mockingProgress stubbingStartedAtLocation:location];
    return [self stub];
}

- (MKTOngoingStubbing *)stub
{
    return [mockingProgress pullOngoingStubbing];
}

- (id)verifyMock:(MKTClassMock *)mock
        withMode:(id <MKTVerificationMode>)mode
      atLocation:(MKTTestLocation)location
{
    if (!mock)
    {
        MKTTestFail(location, @"Argument passed to verify() should be a mock but is nil.");
        return nil;
    }
    
    [mockingProgress verificationStarted:mode atLocation:location];
    return mock;
}

@end
