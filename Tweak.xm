#import "Tweak.h"

// Since there is only one ad cell in the messages tab, we can just store a reference to its indexPath
id messagesAdCell;

%hook _TtC7grindrx27MessagesTableViewController
	- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
		UITableViewCell *tbvCell = %orig;

		NSString *itemClassName = NSStringFromClass([tbvCell classForCoder]);

		if ([itemClassName isEqualToString:@"grindrx.TableViewAdCell"]) {
			[tbvCell setHidden: YES];
			messagesAdCell = arg2;
		}
		return tbvCell;

	}
	- (CGFloat)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
		if (arg2 == messagesAdCell) {
			return 0;
		}

		return %orig;
	}
%end