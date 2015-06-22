/**
 * Commercial : Copyright (c) 2014
 * ArlSoft Tecnologia <contato@arlsoft.com.br>
 *
 * All rights reserved.
 * This is proprietary software.
 * No warranty, explicit or implicit, provided.
 */

#import "BrComArlsoftProgressbarModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation BrComArlsoftProgressbarModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"939241f5-77d8-4774-a3a9-8475b95f4b02";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"br.com.arlsoft.progressbar";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
}

#pragma Public APIs

@end