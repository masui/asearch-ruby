# asearch - approximate pattern matching

* http://github.com/masui/asearch_ruby

## DESCRIPTION:

「"abcde"に近い文字列」のように、
正規表現で指定しにくい曖昧検索を実行します。

## SYNOPSIS:

    a = Asearch.new('abcde')
    a.match('abcde')      # => true
    a.match('abXcde')     # => false
    a.match('abde')       # => false
    a.match('abXcde',1)   # => true
    a.match('abde',1)     # => true

## INSTALL:

    % gem install ruby-asearch

## LICENSE:

(The MIT License)

Copyright (c) 2012 FIXME full name

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.