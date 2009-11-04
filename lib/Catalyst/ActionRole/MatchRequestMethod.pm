package Catalyst::ActionRole::MatchRequestMethod;

use Moose::Role;
use Perl6::Junction 'none';
use namespace::autoclean;

around match => sub {
    my ($orig, $self, $ctx) = @_;
    my @methods = @{ $self->attributes->{Method} || [] };

    # if no request methods have been specified, we still match normally. that
    # doesn't feel very correcy, but dwims very well, especially if you're
    # applying the role to all actions using the controller config. this might
    # be subject to change.
    return 0 if @methods && $ctx->request->method eq none @methods;

    return $self->$orig($ctx);
};

1;
