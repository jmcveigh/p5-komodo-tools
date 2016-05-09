package Thing;

use Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(test);

sub test {
    print "available\n";
}

1;
