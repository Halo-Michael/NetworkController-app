//
//  ViewController.m
//  resolutionsetter
//
//  Created by apple on 2022/10/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)Fix:(id)sender {
	if ([_Bundles text].length > 0) {
		NSMutableArray *bundles = [[_Bundles text] componentsSeparatedByString:@" "];
		if ([bundles containsObject:@""])
			[bundles removeObject:@""];
		
		for (NSString *bundleID in bundles) {
			if (_CTServerConnectionSetCellularUsagePolicy(_CTServerConnectionCreate(kCFAllocatorDefault, NULL, NULL), bundleID, @{@"kCTCellularDataUsagePolicy" : @"kCTCellularDataUsagePolicyAlwaysAllow", @"kCTWiFiDataUsagePolicy" : @"kCTCellularDataUsagePolicyAlwaysAllow"})) {
				[_Status setText:@"Failure!"];
				[_Status setTextColor:[UIColor redColor]];
				[_Status setHidden:NO];
			} else {
				[_Status setText:@"Success!"];
				[_Status setTextColor:[UIColor greenColor]];
				[_Status setHidden:NO];
			}
		}
	}
}

@end
