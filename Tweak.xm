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
%end