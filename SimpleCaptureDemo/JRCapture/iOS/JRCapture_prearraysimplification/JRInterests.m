/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


#import "JRInterests.h"

@implementation JRInterests
{
    NSInteger _interestsId;
    NSString *_interest;
}
@dynamic interestsId;
@dynamic interest;

- (NSInteger)interestsId
{
    return _interestsId;
}

- (void)setInterestsId:(NSInteger)newInterestsId
{
    [self.dirtyPropertySet addObject:@"interestsId"];

    _interestsId = newInterestsId;
}

- (NSString *)interest
{
    return _interest;
}

- (void)setInterest:(NSString *)newInterest
{
    [self.dirtyPropertySet addObject:@"interest"];

    if (!newInterest)
        _interest = [NSNull null];
    else
        _interest = [newInterest copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath = @"/profiles/profile/interests";
    }
    return self;
}

+ (id)interests
{
    return [[[JRInterests alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRInterests *interestsCopy =
                [[JRInterests allocWithZone:zone] init];

    interestsCopy.interestsId = self.interestsId;
    interestsCopy.interest = self.interest;

    return interestsCopy;
}

+ (id)interestsObjectFromDictionary:(NSDictionary*)dictionary
{
    JRInterests *interests =
        [JRInterests interests];

    interests.interestsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    interests.interest = [dictionary objectForKey:@"interest"];

    return interests;
}

- (NSDictionary*)dictionaryFromInterestsObject
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    if (self.interestsId)
        [dict setObject:[NSNumber numberWithInt:self.interestsId] forKey:@"id"];

    if (self.interest && self.interest != [NSNull null])
        [dict setObject:self.interest forKey:@"interest"];
    else
        [dict setObject:[NSNull null] forKey:@"interest"];

    return dict;
}

- (void)updateLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    if ([dictionary objectForKey:@"id"])
        _interestsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];

    if ([dictionary objectForKey:@"interest"])
        _interest = [dictionary objectForKey:@"interest"];
}

- (void)replaceLocallyFromNewDictionary:(NSDictionary*)dictionary
{
    _interestsId = [(NSNumber*)[dictionary objectForKey:@"id"] intValue];
    _interest = [dictionary objectForKey:@"interest"];
}

- (void)updateObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"interestsId"])
        [dict setObject:[NSNumber numberWithInt:self.interestsId] forKey:@"id"];

    if ([self.dirtyPropertySet containsObject:@"interest"])
        [dict setObject:self.interest forKey:@"interest"];

    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface updateCaptureObject:dict
                                     withId:0
                                     atPath:self.captureObjectPath
                                  withToken:[JRCaptureData accessToken]
                                forDelegate:self
                                withContext:newContext];
}

- (void)replaceObjectOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:[NSNumber numberWithInt:self.interestsId] forKey:@"id"];
    [dict setObject:self.interest forKey:@"interest"];

    NSDictionary *newContext = [NSDictionary dictionaryWithObjectsAndKeys:
                                                     self, @"captureObject",
                                                     delegate, @"delegate",
                                                     context, @"callerContext", nil];

    [JRCaptureInterface replaceCaptureObject:dict
                                      withId:0
                                      atPath:self.captureObjectPath
                                   withToken:[JRCaptureData accessToken]
                                 forDelegate:self
                                 withContext:newContext];
}

- (void)dealloc
{
    [_interest release];

    [super dealloc];
}
@end