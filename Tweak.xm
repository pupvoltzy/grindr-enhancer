#import "Tweak.h"

%hook _TtC7grindrx27MessagesTableViewController
	- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
		UITableViewCell *tbvCell = %orig;

		NSString *itemClassName = NSStringFromClass([tbvCell classForCoder]);

		if ([itemClassName isEqualToString:@"grindrx.TableViewAdCell"]) {
			[tbvCell setHidden: YES];
		}
		return tbvCell;

	}
	- (CGFloat)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
		// TODO: Ideally we'd check that the cell is of type AdCell, but this crashes the app for some reason:
		UITableViewCell *tbvCell = [self tableView: arg1 cellForRowAtIndexPath: arg2];

      	NSString *itemClassName = NSStringFromClass([tbvCell classForCoder]);

		if ([itemClassName isEqualToString:@"grindrx.TableViewAdCell"]) {
			return 0;
		}

		return %orig;
	}
%end