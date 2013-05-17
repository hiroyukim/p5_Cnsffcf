requires 'perl', '5.008001';
requires 'Mouse','1.11';
requires 'Text::Xslate', '2.0000';
requires 'YAML::XS', '0.41';
requires 'opts','0.05';
requires 'List::MoreUtils','0.33';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

