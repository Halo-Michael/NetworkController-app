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

- (IBAction)Set:(id)sender {
	if ([_Bundles text].length > 0) {
		NSMutableArray *bundles = [[_Bundles text] componentsSeparatedByString:@" "];
		if ([bundles containsObject:@""])
			[bundles removeObject:@""];
		
		NSDictionary *policies = nil;
		switch (_Settings.selectedSegmentIndex) {
			case 0:
				policies = @{@"kCTWiFiDataUsagePolicy" : @"kCTCellularDataUsagePolicyDeny", @"kCTCellularDataUsagePolicy" : @"kCTCellularDataUsagePolicyDeny"};
				break;
			case 1:
				policies = @{@"kCTWiFiDataUsagePolicy" : @"kCTCellularDataUsagePolicyAlwaysAllow", @"kCTCellularDataUsagePolicy" : @"kCTCellularDataUsagePolicyDeny"};
				break;
			case 2:
				policies = @{@"kCTWiFiDataUsagePolicy" : @"kCTCellularDataUsagePolicyAlwaysAllow", @"kCTCellularDataUsagePolicy" : @"kCTCellularDataUsagePolicyAlwaysAllow"};
				break;
		}
		
		for (NSString *bundleID in bundles) {
			if (_CTServerConnectionSetCellularUsagePolicy(_CTServerConnectionCreate(kCFAllocatorDefault, NULL, NULL), bundleID, policies)) {
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
