# copyright 2003-2011 LOGILAB S.A. (Paris, FRANCE), all rights reserved.
# contact http://www.logilab.fr/ -- mailto:contact@logilab.fr
#
# This file is part of logilab-common.
#
# logilab-common is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, either version 2.1 of the License, or (at your option) any
# later version.
#
# logilab-common is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
# details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with logilab-common.  If not, see <http://www.gnu.org/licenses/>.
"""unit tests for the decorators module
"""

from logilab.common.testlib import TestCase, unittest_main
from logilab.common.decorators import monkeypatch, cached, clear_cache, copy_cache

class DecoratorsTC(TestCase):

    def test_monkeypatch_with_same_name(self):
        class MyClass: pass
        @monkeypatch(MyClass)
        def meth1(self):
            return 12
        self.assertEqual([attr for attr in dir(MyClass) if attr[:2] != '__'],
                          ['meth1'])
        inst = MyClass()
        self.assertEqual(inst.meth1(), 12)

    def test_monkeypatch_with_custom_name(self):
        class MyClass: pass
        @monkeypatch(MyClass, 'foo')
        def meth2(self, param):
            return param + 12
        self.assertEqual([attr for attr in dir(MyClass) if attr[:2] != '__'],
                          ['foo'])
        inst = MyClass()
        self.assertEqual(inst.foo(4), 16)

    def test_cannot_cache_generator(self):
        def foo():
            yield 42
        self.assertRaises(AssertionError, cached, foo)

    def test_cached_preserves_docstrings_and_name(self):
        class Foo(object):
            @cached
            def foo(self):
                """ what's up doc ? """
            def bar(self, zogzog):
                """ what's up doc ? """
            bar = cached(bar, 1)
            @cached
            def quux(self, zogzog):
                """ what's up doc ? """
        self.assertEqual(Foo.foo.__doc__, """ what's up doc ? """)
        self.assertEqual(Foo.foo.__name__, 'foo')
        self.assertEqual(Foo.foo.func_name, 'foo')
        self.assertEqual(Foo.bar.__doc__, """ what's up doc ? """)
        self.assertEqual(Foo.bar.__name__, 'bar')
        self.assertEqual(Foo.bar.func_name, 'bar')
        self.assertEqual(Foo.quux.__doc__, """ what's up doc ? """)
        self.assertEqual(Foo.quux.__name__, 'quux')
        self.assertEqual(Foo.quux.func_name, 'quux')

    def test_cached_single_cache(self):
        class Foo(object):
            @cached(cacheattr=u'_foo')
            def foo(self):
                """ what's up doc ? """
        foo = Foo()
        foo.foo()
        self.assertTrue(hasattr(foo, '_foo'))
        clear_cache(foo, 'foo')
        self.assertFalse(hasattr(foo, '_foo'))

    def test_cached_multi_cache(self):
        class Foo(object):
            @cached(cacheattr=u'_foo')
            def foo(self, args):
                """ what's up doc ? """
        foo = Foo()
        foo.foo(1)
        self.assertEqual(foo._foo, {(1,): None})
        clear_cache(foo, 'foo')
        self.assertFalse(hasattr(foo, '_foo'))

    def test_cached_keyarg_cache(self):
        class Foo(object):
            @cached(cacheattr=u'_foo', keyarg=1)
            def foo(self, other, args):
                """ what's up doc ? """
        foo = Foo()
        foo.foo(2, 1)
        self.assertEqual(foo._foo, {2: None})
        clear_cache(foo, 'foo')
        self.assertFalse(hasattr(foo, '_foo'))

    def test_cached_property(self):
        class Foo(object):
            @property
            @cached(cacheattr=u'_foo')
            def foo(self):
                """ what's up doc ? """
        foo = Foo()
        foo.foo
        self.assertEqual(foo._foo, None)
        clear_cache(foo, 'foo')
        self.assertFalse(hasattr(foo, '_foo'))

    def test_copy_cache(self):
        class Foo(object):
            @cached(cacheattr=u'_foo')
            def foo(self, args):
                """ what's up doc ? """
        foo = Foo()
        foo.foo(1)
        self.assertEqual(foo._foo, {(1,): None})
        foo2 = Foo()
        self.assertFalse(hasattr(foo2, '_foo'))
        copy_cache(foo2, 'foo', foo)
        self.assertEqual(foo2._foo, {(1,): None})

if __name__ == '__main__':
    unittest_main()
