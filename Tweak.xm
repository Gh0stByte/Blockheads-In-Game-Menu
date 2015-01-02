#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#include <substrate.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/BlockheadsInventory.plist"

inline int GetPrefInt(NSString *key)
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

inline bool GetPrefBool(NSString *key) 
{
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline void SetPrefBool(NSString *key, bool value) 
{
	NSNumber *obj = [NSNumber numberWithBool:value];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH];
	[dict setObject:obj forKey:key];
	[dict writeToFile:PLIST_PATH atomically:YES];
}

inline void SetPrefInt(NSString *key, int value) 
{
	NSNumber *obj = [NSNumber numberWithInt:value];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:PLIST_PATH];
	[dict setObject:obj forKey:key];
	[dict writeToFile:PLIST_PATH atomically:YES];
}

//Inventory Hack Method Was Here

NSArray *itemNames = @[@"hand", 
						@"unknown", 
						@"flint", 
						@"sticks", 
						@"unknown", 
						@"flint axe", 
						@"flint spear", 
						@"flint pickaxe", 
						@"double time", 
						@"unknown", 
						@"time crystal", 
						@"baskets", 
						@"embers", 
						@"charcoal", 
						@"campfires", 
						@"flint spades", 
						@"basic torches", 
						@"unknown", 
						@"blockheads", 
						@"food", 
						@"apples", 
						@"mangos", 
						@"maple seeds", 
						@"prickly pears", 
						@"flint machetes", 
						@"unknown", 
						@"pine cones ", 
						@"clay", 
						@"raw dodo meat", 
						@"dodo feathers", 
						@"copper ore", 
						@"iron ore", 
						@"stone axes", 
						@"stone pickaxes", 
						@"copper ingots", 
						@"tin ore", 
						@"tin ingots", 
						@"bronze ingots", 
						@"copper spears", 
						@"tin spades", 
						@"copper arrows", 
						@"copper bow and arrows", 
						@"bronze pickaxes", 
						@"string", 
						@"clay jugs", 
						@"coconuts", 
						@"oil lanterns ", 
						@"oil", 
						@"bronze machetes", 
						@"bronze swords ", 
						@"coal", 
						@"wooden doors", 
						@"ladders", 
						@"flax seeds", 
						@"flax", 
						@"indian yellow", 
						@"red ochre", 
						@"windows", 
						@"cooked dodo meat", 
						@"oranges", 
						@"sunflower seeds", 
						@"corn", 
						@"wooden beds", 
						@"stone spades ", 
						@"iron ingots", 
						@"iron pickaxes", 
						@"iron machetes ", 
						@"iron swords ", 
						@"trapdoors ", 
						@"iron axes", 
						@"carrots", 
						@"gold ingots", 
						@"gold nuggets", 
						@"carrot on sticks", 
						@"rubies", 
						@"emeralds", 
						@"cherries ", 
						@"coffee cherries ", 
						@"green coffee beans", 
						@"cups", 
						@"coffe", 
						@"roasted coffee beans ", 
						@"linen ", 
						@"linen pants", 
						@"linen shirts", 
						@"sapphires ", 
						@"amethysts", 
						@"diamonds", 
						@"gold spades", 
						@"gold pickaxes", 
						@"dodo eggs", 
						@"steel ingots", 
						@"steel pickaxes", 
						@"amethysts pickaxe", 
						@"sapphire pickaxes", 
						@"emerald pickaxes", 
						@"ruby pickaxes", 
						@"diamond pickaxes", 
						@"ultramarine blue", 
						@"carbon black", 
						@"marble white", 
						@"tin bucket", 
						@"paint", 
						@"paint stripper", 
						@"bucket of water", 
						@"pigment", 
						@"unknown - rainbow?", 
						@"unknown", 
						@"emerald green", 
						@"tyrian purple", 
						@"boat", 
						@"chilli", 
						@"unknown - rainbow pants", 
						@"unknown - ranbow shirt", 
						@"linen cap", 
						@"unknown - rainbow cap", 
						@"linen brimmed hat", 
						@"unknown - rainbow hat", 
						@"copper blue", 
						@"leather", 
						@"fur", 
						@"leather jacket", 
						@"unknown - rainbow jacket", 
						@"leather boots", 
						@"unknown - rainbow boots", 
						@"fur coat", 
						@"fur boots", 
						@"unknown", 
						@"unknown", 
						@"leather pants", 
						@"unknown", 
						@"unknown - arrow (up)", 
						@"camera", 
						@"portal", 
						@"amethyst portal", 
						@"saphire portal", 
						@"emerald portal", 
						@"ruby portal", 
						@"diamond portal", 
						@"sunrise hat of fullness", 
						@"sunset skirt of happiness", 
						@"north pole hat of warmth", 
						@"south pole boots of speed", 
						@"kelp", 
						@"amethyst chandelier", 
						@"saphire chandelier", 
						@"emerald chandelier", 
						@"ruby chandelier", 
						@"diamond chandelier", 
						@"steel lanterns",
						@"raw fish",
						@"cooked fish",
						@"tin foil",
						@"tin foil hat",
						@"worm",
						@"fishing rod",
						@"shark jaw",
						@"fish bucket",
						@"shark bucket",
						@"lime",
						@"shelf",
						@"teleport here",
						@"sign",
						@"iron door",
						@"iron trapdoor",
						@"copper coin",
						@"Gold Coin",
						@"shop",
						@"soft bed",
						@"Golden Bed",
						@"unknown",
						@"unknown - rainbow bed",
						@"unknown - gold ^^",
						@"black window",
						@"magnet",
						@"copper boiler",
						@"electric motor",
						@"copper wore",
						@"steam engine",
						@"iron pot",
						@"fish curry",
						@"dodo stew",
						@"ice torch",
						@"silicon ingot",
						@"silicon crystal",
						@"silicon wafer",
						@"tin armor leggings",
						@"tin chest plate",
						@"tin helmet",
						@"tin boots",
						@"iron leggings",
						@"iron chest",
						@"iron helmet",
						@"iron boots",
						@"ice legs",
						@"ice chest",
						@"ice helmet",
						@"ice boots",
						@"rail",
						@"train station",
						@"pig iron",
						@"crushed limestone",
						@"train wheel",
						@"rail handcar",
						@"steam locomotive",
						@"freight car",
						@"display cabinet",
						@"passenger car",
						@"crowbar",
						@"Trade Portal",
						@"unknown",
						@"large s painting",
						@"larg l painting",
						@"larg p painting",
						@"med s painting",
						@"med l painting",
						@"med s painting",
						@"small s painting",
						@"small l painting",
						@"small p painting",
						@"easel",
						@"stone column",
						@"limestone column",
						@"marble column",
						@"sandstone column",
						@"red marble  column",
						@"lapis lazuli column",
						@"basalt column",
						@"stone stairs",
						@"limestone stairs",
						@"marble stairs",
						@"sandstone stairs",
						@"red merble stairs",
						@"lapis lazuli stairs",
						@"basalt stairs",
						@"copper column",
						@"tin column",
						@"bronze column",
						@"iron column",
						@"steel column",
						@"gold column",
						@"wood column",
						@"brick column",
						@"ice column",
						@"copper stairs",
						@"tin stairs",
						@"bronze stairs",
						@"iron stairs",
						@"steel stairs",
						@"gold  stairs",
						@"wood stairs",
						@"brick stairs",
						@"ice stairs",
						@"steel downlight",
						@"poison",
						@"unknown - arrow",
						@"gold bow & arrow",
						@"steel uplight",
						@"world credit",
						@"Platinum Coins",
						@"platinum nugget",
						@"platinum ingot",
						@"platinum stairs",
						@"platinum column",
						@"glass stairs",
						@"glass column",
						@"black glass stairs",
						@"black glass column",
						@"Fuel",
						@"refinery",
						@"epoxy",
						@"raw resin",
						@"carbon fibers",
						@"carbonf sheet",
						@"carbonf wing",
						@"jetpack chassis",
						@"jet engine",
						@"JETPACK",
						@"titanium ore",
						@"titanium ingot",
						@"titanium stairs",
						@"titanium column",
						@"carbonf stairs",
						@"carbonf column",
						@"titanium pickaxes",
						@"titanium sword",
						@"titanium leggings",
						@"titanium chest",
						@"titanium helmet",
						@"titanium boots",
						@"carbonf leggings",
						@"carbonf chest",
						@"carbonf helmet",
						@"carbonf boots",
						@"vine",
						@"tulip bulb",
						@"tulip seed",
						@"unknown - coins",
						@"random ore",
						@"electric sluice",
						@"ownership signs",
						@"Made by Gh0stByte"];



UIViewController *mainViewController;
UIButton *enableMenu;
UIView *view2;
UIView *selectionView;
UIStepper* stepper;
UIButton *button2;
UIButton *button3;
UIButton *button4;
UISwitch *mySwitch;
UITapGestureRecognizer *tapImageRecognizer;
UIScrollView *scrollview;

UILabel * label;
UILabel *label2;


bool ini = false;
bool show = false;

@interface EvolutionAppDelegate : NSObject <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>
@end



int sx = GetPrefInt(@"kX");
int sy = GetPrefInt(@"kY");


#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/BlockheadsInventory.bundle"

NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
NSString *someImage = [bundle pathForResource:@"Background" ofType:@"png"];

bool isServer = false;


//Switches
UISwitch *crystalSwitch;
UISwitch *coinSwitch;
UISwitch *speedSwitch;
UISwitch *doubleSwitch;
UISwitch *sleepSwitch;
UISwitch *meditateSwitch;
UISwitch *viewSwitch;
UISwitch *solarSwitch;
UISwitch *teleportSwitch;
UISwitch *hdSwitch;
UISwitch *levelSwitch;
UISwitch *immortalSwitch;
UISwitch *jetpackSwitch;


UITableView *tableView;
UISearchBar *searchBar;
UISearchDisplayController *searchDC;


NSString *version = @"1.6.2";
NSString *currentVersion;
NSString *features = [NSString stringWithContentsOfURL:
	[NSURL URLWithString:@"http://idroidcheats.net/iOS/blockheadsChangelog"] 
	encoding:NSUTF8StringEncoding error:nil];

%hook EvolutionAppDelegate
-(void)applicationDidBecomeActive:(id)arg1
{
	NSString *config = [NSString stringWithContentsOfURL:
	[NSURL URLWithString:@"http://idroidcheats.net/iOS/blockheads.txt"] 
	encoding:NSUTF8StringEncoding error:nil];
	for (NSString *line in [config componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]) 
	{
		if([line rangeOfString:@"currentVersion="].location != NSNotFound)
		{
			currentVersion = [line stringByReplacingOccurrencesOfString:@"currentVersion=" withString:@""];
		}
	}

	if(![currentVersion isEqualToString:version])
	{
		NSString *message2 = [NSString stringWithFormat:@"There is a new update available!\n\nChangelog:\n%@",features];
		
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Update Available" message:message2 delegate: self cancelButtonTitle:@"OK" otherButtonTitles:@"Update", nil]; [a show]; [a release];
	}
	
	%orig;
	if(!ini && GetPrefBool(@"kBOn"))
	{
		mainViewController = MSHookIvar<UIViewController *>(self, "_viewController");

		view2 = [[[UIView alloc] initWithFrame:CGRectMake(/*50, 50, 200, 150*/sx, sy, 0, 0)] autorelease];
		//[view2 setBackgroundColor:[UIColor blackColor]];
		//[view2 setBackgroundColor:[UIColor colorWithPatternImage:];
		[mainViewController.view addSubview:view2];
		view2.layer.cornerRadius = 5;
		view2.layer.masksToBounds = YES;
		[view2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle alloc] initWithPath:kBundlePath] pathForResource:@"Img" ofType:@"png"]]]];
		
		selectionView = [[[UIView alloc] initWithFrame:CGRectMake(/*50, 50, 200, 150*/sx, sy, 0, 0)] autorelease];
		[selectionView setBackgroundColor:[UIColor blackColor]];
		[mainViewController.view addSubview:selectionView];
		selectionView.layer.cornerRadius = 5;
		selectionView.layer.masksToBounds = YES;

       	scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 2, 164, 191-32)];
        scrollview.showsVerticalScrollIndicator=YES;
        scrollview.scrollEnabled=YES;
        scrollview.userInteractionEnabled=YES;
        scrollview.backgroundColor = [UIColor clearColor];
        [scrollview setContentSize:CGSizeMake(scrollview.bounds.size.width,490)];
        [view2 addSubview:scrollview];

	
		tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0+30,250,360) style:UITableViewStyleGrouped] autorelease];
		tableView.dataSource = self;
		tableView.delegate = self;
		[selectionView addSubview:tableView];



		if(GetPrefBool(@"kSearch"))
		{
			searchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)] autorelease];
			searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
			searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
			searchBar.keyboardType = UIKeyboardTypeAlphabet;
			searchBar.delegate = self;
			tableView.tableHeaderView = searchBar;
		 
			// Create the search display controller
			searchDC = [[[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:mainViewController] autorelease];
			searchDC.searchResultsDataSource = self;
			searchDC.searchResultsDelegate = self;
		
		}
	

		tapImageRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopUp)];
    	[mainViewController.view addGestureRecognizer:tapImageRecognizer];
    	tapImageRecognizer.enabled = NO;


		mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 10, 0, 0)];
		[mySwitch addTarget:self action:@selector(changeState) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:mySwitch];
		label = [[UILabel alloc] initWithFrame:CGRectMake(75, 15, 100, 20)];
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
		label.textColor=[UIColor whiteColor];
		label.text = @"Inventory";
		[scrollview addSubview:label];


		crystalSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 90, 0, 0)];
		[crystalSwitch addTarget:self action:@selector(enableCrystal) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:crystalSwitch];
		UILabel *crystallabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 95, 100, 20)];
		crystallabel.backgroundColor = [UIColor clearColor];
		crystallabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		crystallabel.textColor=[UIColor whiteColor];
		crystallabel.text = @"Crystals";
		[scrollview addSubview:crystallabel];

		coinSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 120, 0, 0)];
		[coinSwitch addTarget:self action:@selector(enableCoins) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:coinSwitch];
		UILabel *coinlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 125, 100, 20)];
		coinlabel.backgroundColor = [UIColor clearColor];
		coinlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		coinlabel.textColor=[UIColor whiteColor];
		coinlabel.text = @"Coins";
		[scrollview addSubview:coinlabel];

		speedSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 150, 0, 0)];
		[speedSwitch addTarget:self action:@selector(enableSpeed) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:speedSwitch];
		UILabel *speedlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 155, 100, 20)];
		speedlabel.backgroundColor = [UIColor clearColor];
		speedlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		speedlabel.textColor=[UIColor whiteColor];
		speedlabel.text = @"Speed";
		[scrollview addSubview:speedlabel];

		doubleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 180, 0, 0)];
		[doubleSwitch addTarget:self action:@selector(enableDouble) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:doubleSwitch];
		UILabel *doublelabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 185, 100, 20)];
		doublelabel.backgroundColor = [UIColor clearColor];
		doublelabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		doublelabel.textColor=[UIColor whiteColor];
		doublelabel.text = @"Double T";
		[scrollview addSubview:doublelabel];

		sleepSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 210, 0, 0)];
		[sleepSwitch addTarget:self action:@selector(enableSleep) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:sleepSwitch];
		UILabel *sleeplabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 215, 100, 20)];
		sleeplabel.backgroundColor = [UIColor clearColor];
		sleeplabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		sleeplabel.textColor=[UIColor whiteColor];
		sleeplabel.text = @"CanSleep";
		[scrollview addSubview:sleeplabel];

		meditateSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 240, 0, 0)];
		[meditateSwitch addTarget:self action:@selector(enableMeditate) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:meditateSwitch];
		UILabel *meditatelabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 245, 100, 20)];
		meditatelabel.backgroundColor = [UIColor clearColor];
		meditatelabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		meditatelabel.textColor=[UIColor whiteColor];
		meditatelabel.text = @"Meditate";
		[scrollview addSubview:meditatelabel];

		viewSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 270, 0, 0)];
		[viewSwitch addTarget:self action:@selector(enableView) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:viewSwitch];
		UILabel *viewlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 275, 100, 20)];
		viewlabel.backgroundColor = [UIColor clearColor];
		viewlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		viewlabel.textColor=[UIColor whiteColor];
		viewlabel.text = @"ViewHak";
		[scrollview addSubview:viewlabel];

		solarSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 300, 0, 0)];
		[solarSwitch addTarget:self action:@selector(enableSolar) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:solarSwitch];
		UILabel *solarlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 305, 100, 20)];
		solarlabel.backgroundColor = [UIColor clearColor];
		solarlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		solarlabel.textColor=[UIColor whiteColor];
		solarlabel.text = @"Solar Hak";
		[scrollview addSubview:solarlabel];

		teleportSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 330, 0, 0)];
		[teleportSwitch addTarget:self action:@selector(enableTeleport) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:teleportSwitch];
		UILabel *teleportlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 335, 100, 20)];
		teleportlabel.backgroundColor = [UIColor clearColor];
		teleportlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		teleportlabel.textColor=[UIColor whiteColor];
		teleportlabel.text = @"Teleport";
		[scrollview addSubview:teleportlabel];

		hdSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 360, 0, 0)];
		[hdSwitch addTarget:self action:@selector(enableHD) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:hdSwitch];
		UILabel *hdlabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 365, 100, 20)];
		hdlabel.backgroundColor = [UIColor clearColor];
		hdlabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		hdlabel.textColor=[UIColor whiteColor];
		hdlabel.text = @"Textures";
		[scrollview addSubview:hdlabel];

		levelSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 390, 0, 0)];
		[levelSwitch addTarget:self action:@selector(enableLevel) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:levelSwitch];
		UILabel *levellabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 395, 100, 20)];
		levellabel.backgroundColor = [UIColor clearColor];
		levellabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		levellabel.textColor=[UIColor whiteColor];
		levellabel.text = @"LevelHak";
		[scrollview addSubview:levellabel];

		immortalSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 420, 0, 0)];
		[immortalSwitch addTarget:self action:@selector(enableImmortal) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:immortalSwitch];
		UILabel *immortallabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 425, 100, 20)];
		immortallabel.backgroundColor = [UIColor clearColor];
		immortallabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		immortallabel.textColor=[UIColor whiteColor];
		immortallabel.text = @"Immortal";
		[scrollview addSubview:immortallabel];

		jetpackSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 450, 0, 0)];
		[jetpackSwitch addTarget:self action:@selector(enableJetpack) forControlEvents:UIControlEventValueChanged];
		[scrollview addSubview:jetpackSwitch];
		UILabel *jetpacklabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 455, 100, 20)];
		jetpacklabel.backgroundColor = [UIColor clearColor];
		jetpacklabel.textAlignment = UITextAlignmentLeft; // UITextAlignmentCenter, UITextAlignmentLeft
		jetpacklabel.textColor=[UIColor whiteColor];
		jetpacklabel.text = @"Jet Fuel";
		[scrollview addSubview:jetpacklabel];

		label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 110, 80, 20)];
		label2.backgroundColor = [UIColor clearColor];
		label2.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
		label2.textColor=[UIColor whiteColor];
		NSString *nsd = [NSString stringWithFormat:@"id: %d", GetPrefInt(@"kItems")];
		label2.text = nsd;

		enableMenu = [UIButton buttonWithType:UIButtonTypeCustom];
		[enableMenu setFrame: CGRectMake(sx, sy, 40, 40)];
		[enableMenu addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
		[mainViewController.view addSubview:enableMenu];
		UIImage *newButtonImage = [UIImage imageWithContentsOfFile:[[[NSBundle alloc] initWithPath:kBundlePath] pathForResource:@"Button22" ofType:@"png"]];
		//Create image object from bundle. Name must include filetype; is case sensetive.
		[enableMenu setImage:newButtonImage forState:UIControlStateNormal];
		[enableMenu setTitle:@"M" forState:UIControlStateNormal];


		button2 = [UIButton buttonWithType:UIButtonTypeSystem];
		[button2 setFrame: CGRectMake(sx, sy+80, 50, 30)];
		[button2 addTarget:self action:@selector(changeDown) forControlEvents:UIControlEventTouchUpInside];
		//[view2 addSubview:button2];
		[button2 setTitle:@"-" forState:UIControlStateNormal];

		button3 = [UIButton buttonWithType:UIButtonTypeSystem];
		[button3 setFrame: CGRectMake(sx + 50, sy+80, 50, 30)];
		[button3 addTarget:self action:@selector(changeUp) forControlEvents:UIControlEventTouchUpInside];
		//[view2 addSubview:button3];
		[button3 setTitle:@"+" forState:UIControlStateNormal];



		button4 = [UIButton buttonWithType:UIButtonTypeSystem];
		[button4 setFrame: CGRectMake(10, 50, 100, 30)];
		[button4 addTarget:self action:@selector(showSelection) forControlEvents:UIControlEventTouchUpInside];
		[scrollview addSubview:button4];
		[button4 setTitle:@"Select Item" forState:UIControlStateNormal];



		UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 20)];
		label3.backgroundColor = [UIColor clearColor];
		label3.textAlignment = UITextAlignmentCenter; // UITextAlignmentCenter, UITextAlignmentLeft
		label3.textColor=[UIColor whiteColor];
		label3.text = @"Select Item";
		[selectionView addSubview:label3];
		ini = true;
	}
	if(GetPrefBool(@"kOn"))
	{
		[mySwitch setOn:YES animated:NO];
	}
	else{
		[mySwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kCrystalsBool"))
	{
		[crystalSwitch setOn:YES animated:NO];
	}
	else{
		[crystalSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kCoins"))
	{
		[coinSwitch setOn:YES animated:NO];
	}
	else{
		[coinSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kSpeed"))
	{
		[speedSwitch setOn:YES animated:NO];
	}
	else{
		[speedSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kDoubleTime"))
	{
		[doubleSwitch setOn:YES animated:NO];
	}
	else{
		[doubleSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kSleep"))
	{
		[sleepSwitch setOn:YES animated:NO];
	}
	else{
		[sleepSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kMeditate"))
	{
		[meditateSwitch setOn:YES animated:NO];
	}
	else{
		[meditateSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kView"))
	{
		[viewSwitch setOn:YES animated:NO];
	}
	else{
		[viewSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kSolar"))
	{
		[solarSwitch setOn:YES animated:NO];
	}
	else{
		[solarSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kTeleport"))
	{
		[teleportSwitch setOn:YES animated:NO];
	}
	else{
		[teleportSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kHD"))
	{
		[hdSwitch setOn:YES animated:NO];
	}
	else{
		[hdSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kCraftItems"))
	{
		[levelSwitch setOn:YES animated:NO];
	}
	else{
		[levelSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kDie"))
	{
		[immortalSwitch setOn:YES animated:NO];
	}
	else{
		[immortalSwitch setOn:NO animated:NO];
	}
	if(GetPrefBool(@"kJetpack"))
	{
		[jetpackSwitch setOn:YES animated:NO];
	}
	else{
		[jetpackSwitch setOn:NO animated:NO];
	}
	if(isServer)
	{
		[mySwitch setOn:NO animated:YES]; 
	}

}

bool en = false;
bool sh = false;

%new
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{       
        [tableView reloadData];
 }

%new
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText 
{
	//searchTextForSearch = searchText;
	for(int i=0; i<itemNames.count; i++)
	{
		//[[itemNames[i]lowercaseString] rangeOfString:[searchText lowercaseString]].location != NSNotFound
		//if([[searchText lowercaseString] isEqualToString:[itemNames[i]lowercaseString]])
		if([[itemNames[i]lowercaseString] rangeOfString:[searchText lowercaseString]].location != NSNotFound)
		{
			NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
			[tableView scrollToRowAtIndexPath:indexPath 
                     atScrollPosition:UITableViewScrollPositionTop 
                             animated:YES];
		}
	}
}

%new
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	
	[searchBar resignFirstResponder];
}



%new
- (void) fetchObjects
{
}


%new
-(void)enableJetpack
{	
	if(GetPrefBool(@"kJetpack"))
	{
		SetPrefBool(@"kJetpack", false);
	}
	else{
		SetPrefBool(@"kJetpack", true);
	}
}

%new
-(void)enableImmortal
{
	if(GetPrefBool(@"kDie"))
	{
		SetPrefBool(@"kDie", false);
	}
	else{
		SetPrefBool(@"kDie", true);
	}
}

%new
-(void)enableLevel
{
	if(GetPrefBool(@"kCraftItems"))
	{
		SetPrefBool(@"kCraftItems", false);
	}
	else{
		SetPrefBool(@"kCraftItems", true);
	}
}

%new
-(void)enableHD
{
	if(GetPrefBool(@"kHD"))
	{
		SetPrefBool(@"kHD", false);
	}
	else{
		SetPrefBool(@"kHD", true);
	}
}

%new
-(void)enableTeleport
{
	if(GetPrefBool(@"kTeleport"))
	{
		SetPrefBool(@"kTeleport", false);
	}
	else{
		SetPrefBool(@"kTeleport", true);
	}
}

%new
-(void)enableSolar
{
	if(GetPrefBool(@"kSolar"))
	{
		SetPrefBool(@"kSolar", false);
	}
	else{
		SetPrefBool(@"kSolar", true);
	}
}

%new
-(void)enableView
{
	if(GetPrefBool(@"kView"))
	{
		SetPrefBool(@"kView", false);
	}
	else{
		SetPrefBool(@"kView", true);
	}
}

%new
-(void)enableMeditate
{
	if(GetPrefBool(@"kMeditate"))
	{
		SetPrefBool(@"kMeditate", false);
	}
	else{
		SetPrefBool(@"kMeditate", true);
	}
}

%new
-(void)enableSleep
{
	if(GetPrefBool(@"kSleep"))
	{
		SetPrefBool(@"kSleep", false);
	}
	else{
		SetPrefBool(@"kSleep", true);
	}
}

%new
-(void)enableDouble
{
	if(GetPrefBool(@"kDoubleTime"))
	{
		SetPrefBool(@"kDoubleTime", false);
	}
	else{
		SetPrefBool(@"kDoubleTime", true);
	}
}

%new
-(void)enableSpeed
{
	if(GetPrefBool(@"kSpeed"))
	{
		SetPrefBool(@"kSpeed", false);
	}
	else{
		SetPrefBool(@"kSpeed", true);
	}
}
%new
-(void)enableCrystal
{
	if(GetPrefBool(@"kCrystalsBool"))
	{
		SetPrefBool(@"kCrystalsBool", false);
	}
	else{
		SetPrefBool(@"kCrystalsBool", true);
	}
}

%new 
-(void)enableCoins
{
	if(GetPrefBool(@"kCoins"))
	{
		SetPrefBool(@"kCoins", false);
	}
	else{
		SetPrefBool(@"kCoins", true);
	}
}

%new
- (void)alertView: (UIAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{

    if([alertView.title isEqualToString:@"Update Available"])
    {
		if([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Update"])
		{	
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ioscheaters.com/topic/8150-"]];
		}
    }
}



%new
-(void)showSelection{
	if(!en)
	{
		selectionView.frame =  CGRectMake(sx-3, sy+40, 250, 360);
		tapImageRecognizer.enabled = YES;
		[tapImageRecognizer setCancelsTouchesInView:NO];
		en = true;
	}
}

%new
-(void)showMenu{
	if(!sh)
	{
		view2.frame =  CGRectMake(sx-3, sy+40, 164, 191);
		tapImageRecognizer.enabled = YES;
		sh = true;
	}
	else
	{
		if(sh && en)
		{
			selectionView.frame = CGRectMake(sx, sy+30, 0, 0);
			view2.frame =  CGRectMake(sx, sy+25, 0, 0);
			tapImageRecognizer.enabled = NO;
			sh = false;
			en = false;
		}
		if(sh)
		{
			view2.frame = CGRectMake(sx, sy+25, 0, 0);
			tapImageRecognizer.enabled = NO;
			sh = false;
		}
	}
}

%new
-(void)dismissPopUp{
	if(en && sh)
	{
		//selectionView.frame =  CGRectMake(0, 30, 0, 0);
		//tapImageRecognizer.enabled = NO;
		en = false;
		sh = false;
	}
	//if only the button is showing
	if(en)
	{
		view2.frame =  CGRectMake(sx, sy+15, 0, 0);
		en = false;
	}
	if(sh)
	{
		selectionView.frame =  CGRectMake(0, 30, 0, 0);
		//[searchBar resignFirstResponder];
		en = false;
	}
}

%new
-(void)changeUp
{
	NSNumber *obj = [NSNumber numberWithInt:GetPrefInt(@"kItems") + 1];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist"];
	[dict setObject:obj  forKey:@"kItems"];
	[dict writeToFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist" atomically:YES];
	NSString *nsd = [NSString stringWithFormat:@"id: %d", GetPrefInt(@"kItems")];
	label2.text = nsd;
}

%new 
-(void)changeDown
{
	NSNumber *obj = [NSNumber numberWithInt:GetPrefInt(@"kItems") - 1];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist"];
	[dict setObject:obj forKey:@"kItems"];
	[dict writeToFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist" atomically:YES];
	NSString *nsd = [NSString stringWithFormat:@"id: %d", GetPrefInt(@"kItems")];
	label2.text = nsd;
}

%new
-(void)changeState
{
	if(isServer)
	{
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Server" message:@"Hack not allowed for use on servers. Donate to get server version." delegate: nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [a show]; [a release];
		[mySwitch setOn:NO animated:YES]; 
	}
	else
	{
		if(GetPrefBool(@"kOn")) 
		{
			NSNumber *obj = [NSNumber numberWithBool:NO];
			NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist"];
			[dict setObject:obj forKey:@"kOn"];
			[dict writeToFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist" atomically:YES];
		} 
		else 
		{
			NSNumber *obj = [NSNumber numberWithBool:YES];
			NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist"];
			[dict setObject:obj forKey:@"kOn"];
			[dict writeToFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist" atomically:YES];
		}
	}	
}

int selectedIndex;

%new
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
%new
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [itemNames count];
    //return 10;
}

%new
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	 // [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    //NSIndexPath *oldIndex = [tableView indexPathForSelectedRow];
    //[tableView cellForRowAtIndexPath:oldIndex].accessoryType = UITableViewCellAccessoryNone;
    //[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    return indexPath;
}
UITableViewCell *cell;

%new
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    if(indexPath.row == selectedIndex)
{
   cell.accessoryType = UITableViewCellAccessoryCheckmark;
}
else
{
   cell.accessoryType = UITableViewCellAccessoryNone;
}
  

    // Set the data for this cell:
    cell.textLabel.text = [itemNames objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = @"More text";
    //cell.imageView.image = [UIImage imageNamed:@"flower.png"];
    
    return cell;
}


	
%new
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	selectedIndex = indexPath.row;
	[tableView reloadData];
    int selectedRow = indexPath.row;
    NSNumber *obj = [NSNumber numberWithInt:selectedRow+1];
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist"];
	[dict setObject:obj  forKey:@"kItems"];
	[dict writeToFile:@"/var/mobile/Library/Preferences/BlockheadsInventory.plist" atomically:YES];
	//tableView cellForRowAtIndexPath:indexPath.accessoryType = UITableViewCellAccessoryCheckmark;

   // [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;

}

%end

%hook HackExample

-(int)coins
{
	if(GetPrefBool(@"kCoins"))
	{
		return 2147483647;
	}
	return %orig;
}

%end

//Hack Methods were all down here