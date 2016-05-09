    #!/usr/bin/perl
     
    =head
    FILESEARCH***FILE_EXTRACTOR
    This script will find any var/char in any txt/log file in current dir or
    dir of your choseing. Will put result in text file in it's own folder,
    useing 'F_E' as the folder name. May have to 'sudo' if in 'system' folders.
    Remember to put "." before file extension ex>> .txt or .log.
     
    acidblue 2012
     
    =cut
     
    use File::Find;
    use Cwd; # may not be necessary
     
     
     
    #variables
    my $ftype;
    my $vartype;
    my @var;
    my $prntscrn;
     
    #main menu function
    sub mainMenu{
    print "1 Use Current Diretory\n";
    print "2 Use Different Directory\n";
    print ">> ";
    chomp($menu = <STDIN>);
    if($menu == 1){
            fileExt();
           
    }
    elsif($menu == 2){
            print "Enter a path\n";
            print ">> ";
            chomp($path = <STDIN>);
            if (opendir(DIR, $path)){ #check file path
            chdir $path;
            print "DIR: $path\n";
            fileExt();
    }
            else{                                   #if path is incorrect re-run mainMenu
                    print "***$path is not correct, check and try again***\n";
                    mainMenu();
            }
    }
           
    }
    mainMenu;
     
    #functions
    sub fileExt{    #get file extension from user
    print "Enter file extension.\n";
    chomp($ftype = <STDIN>);
    #get var/char to search for
    print "Enter var/char to look for.\n";
    print ">> ";
    chomp($vartype = <STDIN>);
     
    find(\&wanted,"."); # call wanted function
    }
     
     
    sub wanted{
            if($_ =~ /($ftype)/){
                    open in , "$File::Find::name";
                    while (<in>){                   # while in the file> search for $vartype
                            if($_ =~ /($vartype)/){
                                    push(@var, $_); # add variable $_ contents to an array
                                                                    #for easy access later
                            }
                           
                    }
                   
            }
            else{
             print "** Not Found ** check file extension and var/char **\n";
                    fileExt();
                            }
           
                                   
           
    }
     
     
     
     
    #end functions
    print "Do you want the results printed the terminal? y or n\n";
    print ">> ";
    chomp($prntscrn = <STDIN>);
            if($prntscrn eq 'Y' or $prntscrn eq 'y'){
                    print @var; #print contents of the @var array to screen,
                                            #maybe too large so make it an option
                                    }
                   
    mkdir 'F_E';
    chdir 'F_E';
    open(FH, ">>Found.txt");#create file to save search, append mode>>
    print FH @var;                  #print contents of the array to the file
    print "Saving contents to 'Found.txt' in the 'F_E' folder\n";
    close FH;

