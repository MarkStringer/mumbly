use warnings;
use LWP::Simple;
use Text::Markdown 'markdown';
use Net::FTP;
use File::Copy;
use Net::Twitter;
use Scalar::Util 'blessed';
use URI::Escape;
use XML::RSS::SimpleGen;
use HTML::Entities;
use Getopt::Long;

my $link="";
my $path;

GetOptions ('path=s' => \$path, 'link=s' => \$link);

if (!$path)
{
	die "Usage is perl screenscrape.pl --path <path> --link <link>\n";
}

print $path,"\n";
print $link,"\n";

##get the link
my $content = get $path || die "Couldn't get $path";

##replace the non-breaking spaces with <BR>
$content =~ s/(\&nbsp\;)+/<br>/gs;

##convert the link to markdown
open (FILE, ">output.htm") || die "Couldn't open the file";
print FILE $content;
close FILE;

##output the text


