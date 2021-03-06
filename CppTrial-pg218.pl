#!/usr/bin/perl

# CppTrial-pg218.pl
# Cross-Platform GUI Programming with wxWidgets - Smart, Hock, & Csomor
# C++ Example from pg 218 - Directory Dialog
# Ported to wxPerl by James M. Lynes Jr. - Last Modified 9/25/2012

use 5.010;
use strict;
use warnings;
use Wx qw(:everything);
use Wx::Event qw(EVT_MOTION);

# create the WxApplication
my $app = Wx::SimpleApp->new;
my $frame = Wx::Frame->new(undef, -1,
		           'CppTrial-pg218.pl',
		           wxDefaultPosition, wxDefaultSize);

# Use status bar to indicate button presses
my $statusBar = Wx::StatusBar->new($frame, wxID_ANY, wxST_SIZEGRIP);
$frame->SetStatusBar($statusBar);
my @widths = (250, 100, -1);
$statusBar->SetFieldsCount($#widths+1);
$statusBar->SetStatusWidths(@widths);
$statusBar->SetStatusText("Ready", 0);

myStdDialogs($frame);

$frame->Show;
$app->MainLoop;


# Example specific code
sub myStdDialogs {
	my ( $self ) = @_;

	my $caption = "Choose A Directory";
	my $defaultPath = "/";
	
	my $dirDialog = Wx::DirDialog->new($self, $caption, $defaultPath, 
			 wxDD_NEW_DIR_BUTTON);
			 
	my $dirDialogStatus = $dirDialog->ShowModal();
	
	my $selecteddir = $dirDialog->GetPath();
#	print $selecteddir, "\n";
	
	if ( $dirDialogStatus == wxID_OK ) {$self->Wx::LogStatus ("You pressed:  \"Open\" ")};
	if ( $dirDialogStatus == wxID_CANCEL ) {$self->Wx::LogStatus ("You pressed:  \"Cancel\" ")};
}
