#import <Preferences/Preferences.h>
#import <substrate.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
@interface BlockheadsInventoryListController: PSListController {
}
@end

@implementation BlockheadsInventoryListController
bool ty = false;
- (id)init
{
	if(ty)
	{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Thank you!" message:@"Thank you for donating! It means a lot to me!\n~Gh0stByte" delegate:nil cancelButtonTitle:@"You're Welcome!" otherButtonTitles:nil]; [a show]; [a release];
		ty = false;
	}
	self = [super init];
	if(self)
	{
		if(!((UINavigationItem*)self.navigationItem).rightBarButtonItem)
		{
			UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Donate" style:UIBarButtonItemStyleBordered target:self action:@selector(donate)];
			((UINavigationItem*)self.navigationItem).rightBarButtonItem = button;
			[button release];
		}
	}
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;
	//Adsense In Patchers
	UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, screenHeight -50, screenWidth,screenHeight-100)];
       	[self.view addSubview:webview];
       	webview.scrollView.scrollEnabled = NO; 
		webview.scrollView.bounces = NO;
	//webview.scalesPageToFit = YES;
       NSString *url=@"http://idroidcheats.net/iOS/index.html";
	NSURL *nsurl=[NSURL URLWithString:url];
	NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
	[webview loadRequest:nsrequest];

	return self;
}
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BlockheadsInventory" target:self] retain];
	}
	return _specifiers;
}

-(void)donate{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://bit.ly/Gh0stBytePayPal"]];
	ty = true;
}
-(void)iOSCheaters
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://iOSCheaters.com"]];
}
-(void)respring
{
	system("killall SpringBoard");
}
@end

@interface HackSettingsListController : PSListController {}
@end
@implementation HackSettingsListController
@end
@interface Hack2SettingsListController : PSListController {}
@end
@implementation Hack2SettingsListController
@end
@interface ToggleSettingsListController : PSListController {}
@end
@implementation ToggleSettingsListController
@end
@interface CreditsSettingsListController : PSListController {}
@end
@implementation CreditsSettingsListController
-(void)donate
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://bit.ly/Gh0stBytePayPal"]];
}
-(void)iOSCheaters
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://iOSCheaters.com"]];
}
@end

// vim:ft=objc
//m:ft=objc
