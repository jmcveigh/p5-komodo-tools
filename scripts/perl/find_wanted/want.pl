#!/usr/bin/perl

use warnings;
use strict;

=head
FILESEARCH***FILE_EXTRACTOR
This script will find any var/char in any txt/log file in current dir or
dir of your choseing. Will put result in text file in it's own folder,
useing 'F_E' as the folder name. May have to 'sudo' if in 'system' folders.
Remember to put "." before file extension ex>> .txt or .log.
 
acidblue 2012
 
=cut
 
use File::Find;
use Cwd; 
 
my $ftype;
my $vartype;
my @var;
 
sub mainMenu{

	print "1 Use Current Diretory\n";
	print "2 Use Different Directory\n";
	print ">> ";
	chomp( my $menu = <STDIN>);

	if($menu == 1){
		fileExt();
	}
	elsif($menu == 2){

		print "Enter a path\n";
		print ">> ";
	    chomp(my $path = <STDIN>);

		if (opendir(DIR, $path)){ 
	        chdir $path;
	        print "DIR: $path\n";
	        fileExt();
		}
		else{   
			print "***$path is not correct, check and try again***\n";
			mainMenu();
	    }
	}
}

mainMenu();

sub fileExt{    

	my $path = cwd();

	print "Enter file extension.\n";
	chomp( $ftype = <STDIN>);

	print "Enter var/char to look for.\n";
	print ">> ";
	
	chomp( $vartype = <STDIN> );

	# find now calls the preprocess() function
	# to remove directory entries so we don't recurse

	find({
			wanted => \&wanted, 
			preprocess => \&preprocess,
		},  $path,
	);
}
sub wanted{

	# only match the file ext. if it is
	# at the end of the filename

	if($File::Find::name =~ /$ftype$/){

		open my $in , '<', $File::Find::name || die "Can't open file!: $!";

        while (my $line = <$in>){
        	if($line =~ /$vartype/){
 	       		push(@var, $line); 
        	}
    	}
    }
}
sub preprocess {
	
	# this function removes the directories
	# from the working directory so wanted()
	# doesn't recurse

	my @dir_list = @_;
	my @files;

	for my $file (@dir_list){
		push @files, $file if ! -d $file;
	}

	return @files;
}

# if we didn't find anything,
# start over

if (! @var){
	print "No matches found. Please try again\n";
	fileExt();
}

print "Do you want the results printed the terminal? y or n\n";
print ">> ";
chomp( my $prntscrn = <STDIN>);

if($prntscrn eq 'Y' or $prntscrn eq 'y'){
	print @var; #print contents of the @var array to screen,
}
               
mkdir 'F_E';
chdir 'F_E';
open my $result_fh, '>>', "Found.txt" or die "Can't open the results file Found.txt!: $!";
print $result_fh @var;  
print "Saving contents to 'Found.txt' in the 'F_E' folder\n";
close $result_fh;
