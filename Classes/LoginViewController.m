//
//  LoginViewController.m
//  TFC-iEarNotes
//
//  Created by Tiago Bras on 10/09/24.
//  Copyright 2010 Unknow. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController

enum Sections {
	kCredentialsSection = 0,
	kLoginSection,
	NUM_SECTIONS
};

static NSInteger sectionRowsNumber[NUM_SECTIONS] = {
	2, 1
};

// for tagging our embedded controls for removal at cell recycle time
#define kViewTag				1

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Autenticação";

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == kCredentialsSection) {
		return [NSString stringWithString:@"Credencias"];
	}
	
	// FIXME: Pode causar erro
	return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUM_SECTIONS;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return sectionRowsNumber[section];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = nil;
	
	if (indexPath.section == 0) {
		if ([indexPath row] == 0) {
			cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			} 
			
			cell.textLabel.text = NSLocalizedString(@"Name", @"");
			cell.textLabel.textAlignment = UITextAlignmentLeft;
			cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
			UITextField *textField = [self textFieldUsername];
			[cell.contentView addSubview:textField];
			
		} else if (indexPath.row == 1) {
			cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
			}
			
			cell.textLabel.text = NSLocalizedString(@"Password", @"");
			cell.textLabel.textAlignment = UITextAlignmentLeft;
			cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
			UITextField *textField = [self textFieldPassword];
			[cell.contentView addSubview:textField];
		}
	} else {
		cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
			cell.selectionStyle = UITableViewCellSelectionStyleBlue;
			
			cell.textLabel.textAlignment = UITextAlignmentCenter;
			cell.textLabel.textColor = [UIColor blackColor];
			cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0];
			cell.textLabel.highlightedTextColor = [UIColor blackColor];
		}
		
		cell.textLabel.text = @"Autenticar";
	}

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
	return YES;
}

- (UITextField *)textFieldUsername {
	if (textFieldUsername == nil)
	{
		CGRect frame = CGRectMake(140,12,130,20);
		textFieldUsername = [[UITextField alloc] initWithFrame:frame];
		
		textFieldUsername.borderStyle = UITextBorderStyleNone;
		textFieldUsername.textColor = [UIColor blueColor];
		textFieldUsername.font = [UIFont systemFontOfSize:17.0];
		textFieldUsername.placeholder = NSLocalizedString(@"Name", @"");
		textFieldUsername.backgroundColor = [UIColor whiteColor];
		textFieldUsername.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		textFieldUsername.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		textFieldUsername.returnKeyType = UIReturnKeyDone;
		
		textFieldUsername.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		textFieldUsername.tag = kViewTag;		// tag this control so we can remove it later for recycled cells
		
		textFieldUsername.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		// Add an accessibility label that describes what the text field is for.
		[textFieldUsername setAccessibilityLabel:NSLocalizedString(@"NormalTextField", @"")];
	}	
	
	return textFieldUsername;
}


- (UITextField *)textFieldPassword {
	if (textFieldPassword == nil)
	{
		CGRect frame = CGRectMake(140,12,130,20);
		textFieldPassword = [[UITextField alloc] initWithFrame:frame];
		
		textFieldPassword.borderStyle = UITextBorderStyleNone;
		textFieldPassword.textColor = [UIColor blueColor];
		textFieldPassword.font = [UIFont systemFontOfSize:17.0];
		textFieldPassword.placeholder = @"Palavra chave";
		textFieldPassword.backgroundColor = [UIColor whiteColor];
		textFieldPassword.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		
		textFieldPassword.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		textFieldPassword.returnKeyType = UIReturnKeyDone;
		textFieldPassword.secureTextEntry = YES;
		
		textFieldPassword.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
		
		textFieldPassword.tag = kViewTag;		// tag this control so we can remove it later for recycled cells
		
		textFieldPassword.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
		
		// Add an accessibility label that describes what the text field is for.
		[textFieldPassword setAccessibilityLabel:NSLocalizedString(@"NormalTextField", @"")];
	}	
	
	return textFieldPassword;
}

- (void)dealloc {
    [super dealloc];
}


@end

