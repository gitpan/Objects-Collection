package Objects::Collection::Item;

use strict;
use warnings;
use strict;
use Carp;
use Data::Dumper;
use Objects::Collection::Base;
@Objects::Collection::Item::ISA    = qw(Objects::Collection::Base);
$Objects::Collection::Item::VERSION = '0.02';
attributes(qw/ _attr/);
sub init { return 1 };#if suss
sub _init {
    my $self = shift;
    $self->_attr(shift);
    return $self->init(@_);  
}
sub _get_attr {
    return $_[0]->_attr;
}
sub _changed {
    my $self = shift;
    my $rec = $self->_attr();
    if (ref $rec eq 'HASH' and my $obj = tied %$rec ) {
        return $obj->_changed;
    } else {
        carp ref($self)."Not tied _attr"
    }
    return 0
}
# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Objects::Collection - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Objects::Collection;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Objects::Collection, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.


=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Zagatski Alexandr, E<lt>zag@zagE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Zagatski Alexandr

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
