package Objects::Collection::Base;

#$Id: Base.pm,v 1.3 2006/04/27 14:56:19 zag Exp $

use strict;
use warnings;
use strict;
use Carp;
use Data::Dumper;
require Exporter;
@Objects::Collection::Base::ISA    = qw(Exporter);
@Objects::Collection::Base::EXPORT = qw(attributes);
$Objects::Collection::Base::VERSION = '0.01';

sub attributes {
    my ($pkg) = caller;
    no strict;
    croak "Error: attributes() invoked multiple times"
      if scalar @{"${pkg}::__ATTRIBUTES__"};

    @{"${pkg}::__ATTRIBUTES__"} = @_;
    my $code = "";
    foreach my $attr (@_) {
        if ( UNIVERSAL::can( $pkg, "$attr" ) ) {
            next;
        }
        $code .= _define_accessor( $pkg, $attr );
    }
    eval $code;
}

sub _define_accessor {
    my ( $pkg, $attr ) = @_;
    my $code = qq{
    package $pkg;
    sub $attr {                                      # Accessor ...
      my \$self=shift;
      \@_ ? \$self->{ Var }->{ $attr } = shift : \$self->{ Var }->{ $attr };
    }
  };
    $code;
}

sub new {
    my $class = shift;
    my $self  = {};
    my $stat;
    bless( $self, $class );
    return ( $stat = $self->_init(@_) ) ? $self : $stat;
}

sub _init {
    my $self = shift;
    return 1;
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
