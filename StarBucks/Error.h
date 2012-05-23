//
//  Error.h
//  VideoSurveillance
//
//  Created by zhuhaoyang on 11-12-14.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Error : NSObject 
{
	NSError *m_NSError;/* m_NSError.code ------------------------>
						
						typedef enum _ASINetworkErrorType
						{
						ASIConnectionFailureErrorType = 1,
						ASIRequestTimedOutErrorType = 2,
						ASIAuthenticationErrorType = 3,
						ASIRequestCancelledErrorType = 4,
						ASIUnableToCreateRequestErrorType = 5,
						ASIInternalErrorWhileBuildingRequestType  = 6,
						ASIInternalErrorWhileApplyingCredentialsType  = 7,
						ASIFileManagementError = 8,
						ASITooMuchRedirectionErrorType = 9,
						ASIUnhandledExceptionError = 10,
						ASICompressionError = 11
						} ASINetworkErrorType;
						
						<---------------------------------------
						*/
	NSString *m_Message;
}

@property (nonatomic, strong) NSError *m_NSError;
@property (nonatomic, strong) NSString *m_Message;

@end
