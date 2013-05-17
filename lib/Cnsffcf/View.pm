package Cnsffcf::View;
use Mouse;
use Text::Xslate;

sub render {
    my ($class,$path,$filename,$args) = @_;

    return Text::Xslate->new(
        syntax     => 'Kolon',
        path       => [$path],
        verbose    => 1,
    )->render($filename,$args);
}

1;
