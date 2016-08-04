//
//  ABaseServer.m
//  AtHomeApp
//
//  Created by dilei liu on 14-9-2.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "ABaseServer.h"
#import "SBJsonParser.h"
#import "TBXML.h"

@implementation ABaseServer

- (id)init {
    self = [super init];
    _requestQueue = [[ASINetworkQueue alloc] init];
    [_requestQueue setDelegate:self];
    [_requestQueue setRequestDidFailSelector:@selector(requestFailed:)];
    [_requestQueue setRequestDidFinishSelector:@selector(requestFinished:)];
    [_requestQueue setRequestWillRedirectSelector:@selector(request:willRedirectToURL:)];
    [_requestQueue setShouldCancelAllRequestsOnFailure:NO];
    [_requestQueue setShowAccurateProgress:YES];
    
    return self;
}

#pragma mark - Methods
- (void)setGetUserInfo:(ASIHTTPRequest *)request withRequestType:(RequestType)requestType {
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[NSNumber numberWithInt:requestType] forKey:USER_INFO_KEY_TYPE];
    [request setUserInfo:dict];
    [dict release];
}

- (void)setPostUserInfo:(ASIFormDataRequest *)request withRequestType:(RequestType)requestType {
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[NSNumber numberWithInt:requestType] forKey:USER_INFO_KEY_TYPE];
    [request setUserInfo:dict];
    [dict release];
}

- (void)setUserInfo:(NSDictionary*)requestInfo {
    [_requestQueue setUserInfo:requestInfo];
}

- (NSURL*)generateURL:(NSString*)baseURL params:(NSDictionary*)params {
	if (params) {
		NSMutableArray* pairs = [NSMutableArray array];
		for (NSString* key in params.keyEnumerator) {
			NSString* value = [params objectForKey:key];
			NSString* escaped_value = (NSString *)CFURLCreateStringByAddingPercentEscapes(
																						  NULL, /* allocator */
																						  (CFStringRef)value,
																						  NULL, /* charactersToLeaveUnescaped */
																						  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
																						  kCFStringEncodingUTF8);
            
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
			[escaped_value release];
		}
		
		NSString* query = [pairs componentsJoinedByString:@"&"];
		NSString* url = [NSString stringWithFormat:@"%@?%@", baseURL, query];
		return [NSURL URLWithString:url];
	} else {
		return [NSURL URLWithString:baseURL];
	}
}

#pragma mark - Operate queue
- (BOOL)isRunning {
	return ![_requestQueue isSuspended];
}

- (void)start {
	if( [_requestQueue isSuspended] )
		[_requestQueue go];
}

- (void)pause {
	[_requestQueue setSuspended:YES];
}

- (void)resume {
	[_requestQueue setSuspended:NO];
}

- (void)cancel {
	[_requestQueue cancelAllOperations];
}


#pragma mark - request response method
- (void)requestFinished:(ASIHTTPRequest *)request {
    
    NSDictionary *respinfo = request.responseHeaders;
    NSString *contentType = [respinfo objectForKey:@"Content-Type"];
        
    if([contentType hasPrefix:@"text/html"] ||
       [contentType hasPrefix:@"text/javascript"] ||
       [contentType hasPrefix:@"application/json"])  { // txt
        
        NSString * responseString = [request responseString];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        id returnObject = [parser objectWithString:responseString];
        
        NSMutableDictionary *packedData = [[NSMutableDictionary alloc]init];
        if ([returnObject isKindOfClass:[NSDictionary class]]) {
            [packedData setValue:(NSDictionary*)returnObject forKey:@"packedData"];
        } else if ([returnObject isKindOfClass:[NSArray class]]) {
            [packedData setValue:(NSArray*)returnObject forKey:@"packedData"];
        }
        else {
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:responseString,@"respvalue",@"0",@"status",nil];
            [packedData setValue:dict forKey:@"packedData"];
        }
        
        [packedData addEntriesFromDictionary:[request userInfo]];
        [request setUserInfo:packedData];
    
    } else if ([contentType hasPrefix:@"text/xml"]){ // xml
        NSString * responseString = [request responseString];
        NSString *jsonBody;
    
        NSError *error;
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:responseString error:&error];
        jsonBody = [TBXML textForElement:tbxml.rootXMLElement];
        [tbxml release];
        
        responseString = jsonBody;
        
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        id returnObject = [parser objectWithString:responseString];
        
        [parser release];
        if ([returnObject isKindOfClass:[NSDictionary class]]) {
            NSString *errorString = [returnObject  objectForKey:@"error"];
            if (errorString != nil && ([errorString isEqualToString:@"auth faild!"] ||
                                       [errorString isEqualToString:@"expired_token"] ||
                                       [errorString isEqualToString:@"invalid_access_token"])) {
                NSLog(@"-------------------------detected auth faild!");
            }
        }
        
        NSMutableDictionary *packedData = [[NSMutableDictionary alloc]init];
        if ([returnObject isKindOfClass:[NSDictionary class]]) {
            [packedData setValue:(NSDictionary*)returnObject forKey:@"packedData"];
        } else if ([returnObject isKindOfClass:[NSArray class]]) {
            [packedData setValue:(NSArray*)returnObject forKey:@"packedData"];
        }
        else {
            return;
        }
        
        [packedData addEntriesFromDictionary:[request userInfo]];
        [request setUserInfo:packedData];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSDictionary *requestDictionary = [request userInfo];
    id failureCallback  = [requestDictionary objectForKey:kFailureCallback];
    ((void(^)(NSString *))failureCallback)(@"网络请求异常");
}

-(void)dealloc {
    
    [_userId release];
    _userId = nil;
    
    [_authToken release];
    _authToken = nil;
    
    [_authCode release];
    _authCode = nil;
    
    [_requestQueue release];
    _requestQueue = nil;

    [super dealloc];
}

@end
