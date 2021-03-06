/**
*	The BSD 2-Clause License (aka "FreeBSD License")
*
*	Copyright (c) 2012, Benjamin Thiel, Kamil Kloch
*	All rights reserved.
*
*	Redistribution and use in source and binary forms, with or without
*	modification, are permitted provided that the following conditions are met: 
*
*	1. Redistributions of source code must retain the above copyright notice, this
*	   list of conditions and the following disclaimer. 
*	2. Redistributions in binary form must reproduce the above copyright notice,
*	   this list of conditions and the following disclaimer in the documentation
*	   and/or other materials provided with the distribution. 
*
*	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
*	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
*	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
*	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
*	ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
*	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
*	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

#import "PositionPacket.h"

@implementation PositionPacket

@synthesize location, displayName;

//the keys used by NSKeyed(Un)Archiver
NSString* const locationKey = @"absoluteLocation";
NSString* const displayNameKey = @"displayName";

-(id)init {
    
    if (self = [super init]) {
        
        location = nil;
        displayName = nil;
    }
    return self;
}

-(id)initWithLocation:(AbsoluteLocationEntry *)_location displayName:(NSString *)_displayName {
    
    if (self = [super init]) {
        
        location = [_location retain];
        displayName = [_displayName retain];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [self init];
    
    location = [[aDecoder decodeObjectForKey:locationKey] retain];
    displayName = [[aDecoder decodeObjectForKey:displayNameKey] retain];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:location forKey:locationKey];
    [aCoder encodeObject:displayName forKey:displayNameKey];
}

-(void)dealloc {
    
    [location release];
    [displayName release];
    [super dealloc];
}
@end
