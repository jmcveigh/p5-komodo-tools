#!/usr/bin/perl
use warnings;
use strict;
use feature 'say';

use File::Path qw(make_path remove_tree);
use File::Touch;
use Inline 'C';

#my $dir = '.';
my $dir = 'a';

make_path('a/b/c/d', 'a/a', 'a/b/b', 'a/b/c/c', 'a/b/c/d/d');

my @files = qw(
    a/a.txt a/b/b.txt a/b/c/c.txt a/b/c/d/d.txt
    a/b.txt a/b/c.txt a/b/c/d.txt a/b/c/d/e.txt 
    a/a/1.txt a/b/b/2.txt a/b/c/c/3.txt a/b/c/d/d/4.txt
);

touch(@files);

listdir($dir, 10);

remove_tree('a');

__END__
__C__

#include <unistd.h>
#include <sys/types.h>
#include <dirent.h>
#include <stdio.h>

void listdir(const char *name, int level){

    DIR *dir;
    struct dirent *entry;

    if (!(dir = opendir(name))){
        return;
    }
    if (!(entry = readdir(dir))){
        return;
    }

    do {
        if (entry->d_type == DT_DIR){
            char path[1024];
            int len = snprintf(path, sizeof(path)-1, "%s/%s", name, entry->d_name);
            path[len] = 0;
            if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
                continue;
            printf("%*s[%s]\n", level*2, "", entry->d_name);
            listdir(path, level + 1);
        }
        else
            printf("%*s- %s\n", level*2, "", entry->d_name);
    } while (entry = readdir(dir));
    closedir(dir);
}
