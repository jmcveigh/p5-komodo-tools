#!/usr/bin/perl

use DBI;
use Net::FTP;
use File::Basename;

use warnings;
use strict;

#connection paraneters to localhost

my $IP='192.168.1.2';
my $users='stevieb';
my $password='blah';
my $directory="/";

#Connection to netboss

my $ftp = Net::FTP->new($IP, Debug => 0, Passive => 0) or die "cannot connect";
$ftp->login($users,$password);
$ftp->cwd($directory);

print $ftp->pwd() ."\n";

#list files

my @fichier = $ftp->ls($directory);

for my $entry (@fichier) {

    my $filename = basename( $entry );
    
    if( $filename =~ "blah.txt" ){

        #$ftp->get($file,"C:/users/Desk/personal".$file);
        $ftp->get( $filename );
    }
}
$ftp->quit;

 

