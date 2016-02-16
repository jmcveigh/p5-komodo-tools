package MemberSite::Model::Utils;
use base 'Catalyst::Model::Adaptor';

__PACKAGE__->config({ class => 'MemberSite::Model::Utils' });

sub add_flag {
    my $self = shift;
    my $flagstr = shift;
    my $flag_to_add = shift;
    
    return(_add_letter($flag_to_add, $flagstr));
}

sub add_achievment {
    my $self = shift;
    my $achievmentstr = shift;
    my $achievment_to_add = shift;
    
    return(_add_letter($achievment_to_add, $achievmentstr));
}

sub del_flag {
    my $self = shift;
    my $flagstr = shift;
    my $flag_to_del = shift;
    
    return(_del_letter($flag_to_del, $flagstr));
}

sub del_achievment {
    my $self = shift;
    my $achievmentstr = shift;
    my $achievment_to_del = shift;
    
    return(_del_letter($achievment_to_del, $achievmentstr));
}

sub _add_letter {
    my $self = shift;
    my $atom_to_add = shift;
    my $atomstr = shift;
    
    @atoms = sort split(//, $atomstr . $atom_to_add);
    return "@atoms";
}

sub _del_letter {
    my $self = shift;
    my $atom_to_del = shift;
    my $str = shift;
    
    my $ret = $str;
    $ret =~ s/$atom_to_del//;
    return $ret;
}

1;