//
//  ProfileEditValueController.m
//  appbuildr
//
//  Created by William Johnson on 1/11/11.
//  Copyright 2011 pointabout. All rights reserved.
//

#import "SocializeProfileEditValueViewController.h"
#import "UIButton+Socialize.h"
#import "SocializeEditValueTableViewCell.h"


@implementation SocializeProfileEditValueViewController
@synthesize editValueCell;
@synthesize editValueField;
@synthesize indexPath;
@synthesize valueToEdit;
@synthesize didEdit;
@synthesize cancelButton = cancelButton_;
@synthesize saveButton = saveButton_;
@synthesize delegate = delegate_;
@synthesize tableHeaderView = tableHeaderView_;

#pragma mark -
#pragma mark View lifecycle

- (void)dealloc {
    self.editValueCell = nil;
    self.editValueField = nil;
    self.indexPath = nil;
    self.valueToEdit = nil;    
    self.cancelButton = nil;
    self.saveButton = nil;
    self.tableHeaderView = nil;
    
    [super dealloc];
}

- (void)viewDidUnload {
    self.saveButton = nil;
    self.cancelButton = nil;
}

- (UIBarButtonItem*)cancelButton {
    if (cancelButton_ == nil) {
        UIButton * actualButton = [UIButton redSocializeNavBarButtonWithTitle:@"Cancel"];
        [actualButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        cancelButton_ = [[UIBarButtonItem alloc] initWithCustomView:actualButton];
    }
    return cancelButton_;
}

- (UIBarButtonItem*)saveButton {
    if (saveButton_ == nil) {
        UIButton * actualButton = [UIButton blueSocializeNavBarButtonWithTitle:@"Save"];
        [actualButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        saveButton_ = [[UIBarButtonItem alloc] initWithCustomView:actualButton];
    }
    return saveButton_;
}

- (void)saveButtonPressed:(UIButton*)saveButton {
    [self.delegate profileEditValueViewControllerDidSave:self];
}

- (void)cancelButtonPressed:(UIButton*)cancelButton {
    [self.delegate profileEditValueViewControllerDidCancel:self];
}

- (UIView*)tableHeaderView {
    if (tableHeaderView_ == nil) {
        CGRect tableHeaderFrame = CGRectMake(0, 0, self.view.frame.size.width, 30);
        tableHeaderView_ = [[UIView alloc] initWithFrame:tableHeaderFrame];
    }
    return tableHeaderView_;
}

- (void)viewDidLoad {

    [super viewDidLoad];
	self.tableView.separatorColor = [UIColor darkGrayColor];
	self.tableView.tableHeaderView = self.tableHeaderView;
    UIColor *tableBackgroundColor = [UIColor colorWithRed:50/255.0f green:58/255.0f blue:67/255.0f alpha:1.0];
    self.tableView.backgroundColor = tableBackgroundColor;

    self.navigationItem.leftBarButtonItem = self.cancelButton;
    self.navigationItem.rightBarButtonItem = self.saveButton;
	self.navigationItem.rightBarButtonItem.enabled = NO;
    
    self.didEdit = NO;
}


- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
	[self.tableView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)editOccured {
	self.didEdit = YES;
	self.navigationItem.rightBarButtonItem.enabled = self.didEdit;    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self editOccured];
	return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self editOccured];
	return YES;	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        [self.bundle loadNibNamed:@"SocializeEditValueTableViewCell" owner:self options:nil];
		cell = self.editValueCell;
		self.editValueCell = nil;
    }
    
	self.editValueField.placeholder = self.title;
    self.editValueField.accessibilityLabel = self.title;
	self.editValueField.text = self.valueToEdit;
	[self.editValueField becomeFirstResponder];
    
    return cell;
}


@end

