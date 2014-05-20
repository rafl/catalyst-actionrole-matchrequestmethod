use strict;
use warnings;
use Test::More 0.89;
use HTTP::Request::Common qw/GET POST DELETE/;

use FindBin;
use lib "$FindBin::Bin/lib";

use Catalyst::Test 'TestApp';
use HTTP::Request::Common;

is(request(GET    '/foo')->content, 'get');
is(request(POST   '/foo')->content, 'post');
is(request(DELETE '/foo')->content, 'default');

is(request(GET    '/bar')->content, 'get or post');
is(request(POST   '/bar')->content, 'get or post');
is(request(DELETE '/bar')->content, 'default');

is(request(GET    '/baz')->content, 'any');
is(request(POST   '/baz')->content, 'any');
is(request(DELETE '/baz')->content, 'any');

is(request(PUT '/')->content, 'put from chained');
is(request(GET '/')->content, 'get from chained');

done_testing;
