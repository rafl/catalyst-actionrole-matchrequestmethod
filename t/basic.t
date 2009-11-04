use strict;
use warnings;
use Test::More;
use HTTP::Request::Common;

use FindBin;
use lib "$FindBin::Bin/lib";

use Catalyst::Test 'TestApp';

is(request(GET  '/foo')->content, 'get');
is(request(POST '/foo')->content, 'post');
is(request(HEAD '/foo')->content, 'default');

is(request(GET  '/bar')->content, 'get or post');
is(request(POST '/bar')->content, 'get or post');
is(request(HEAD '/bar')->content, 'default');

done_testing;
