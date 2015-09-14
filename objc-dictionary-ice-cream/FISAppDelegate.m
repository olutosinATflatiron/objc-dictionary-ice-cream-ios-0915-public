//
//  FISAppDelegate.m
//  objc-dictionary-ice-cream
//
//  Created by Mark Murray on 7/6/15.
//  Copyright (c) 2015 Mark Murray. All rights reserved.
//

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end

@implementation FISAppDelegate

- (NSArray *) namesForIceCream: (NSString *) iceCream
{
    NSDictionary *nameFlavor = @{@"Joe" : @"Peanut Butter and Chocolate",
                                 @"Tim" : @"Natural Vanilla",
                                 @"Sophie" : @"Mexican Chocolate",
                                 @"Deniz" : @"Natural Vanilla",
                                 @"Tom" : @"Mexican Chocolate",
                                 @"Jim" : @"Natural Vanilla",
                                 @"Mark" : @"Cookies 'n Cream" };
    
    NSMutableArray *peopleThatLikeIceCreamFlavorInArgument = [[NSMutableArray alloc] init];
    
    for (NSString *key in nameFlavor) {
        if ([nameFlavor[key]  isEqual: iceCream]) {
            [peopleThatLikeIceCreamFlavorInArgument addObject:(key)];
        }
    }
    
    return peopleThatLikeIceCreamFlavorInArgument;
}


- (NSDictionary *) countsOfIceCream: (NSDictionary *) iceCreamByName
{
    NSMutableDictionary *keyFlavor_ValueNumberofPeopleWhoLikeFlavor =[[NSMutableDictionary alloc] init];
    
    // for each key->value
    // send the ice cream flavor to nameForIceCream to get array of how many people
    // in new dictionary put count, ice cream flavor
    // ** dictionary only hold one key->value pair
    // ** dictionary setValue only takes object not primitive 

    for (NSString *key in iceCreamByName)
    {
        NSArray  *temp = [self namesForIceCream:(iceCreamByName[key])];
        NSNumber *tempCount = @([temp count]);
        [keyFlavor_ValueNumberofPeopleWhoLikeFlavor setValue:tempCount forKey:(iceCreamByName[key])];
    }
    return keyFlavor_ValueNumberofPeopleWhoLikeFlavor;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

//Write the countsOfIceCream body which returns a dictionary of the number (value) of people who like each flavor of ice cream (key). Look at the countsByIceCream dictionary in the FISAppDelegateSpec file to better understand what the test is expecting.

//Hint: Try using the namesForIceCream: method that you just wrote to get a list of names for each ice cream flavor by calling it on self. This method returns an array of names which you can then count. Remember that you have to convert integer values to NSNumber in order to store them in a collection.

@end
