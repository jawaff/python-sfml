#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# pySFML2 - Cython SFML Wrapper for Python
# Copyright 2012, Jonathan De Wachter <dewachter.jonathan@gmail.com>
#
# This software is released under the GPLv3 license.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cimport dsystem
from dsystem cimport Int8, Int16, Int32, Int64
from dsystem cimport Uint8, Uint16, Uint32, Uint64

from sfml.system.position import Position
from sfml.system.size import Size
from sfml.system.rectangle import Rectangle

class SFMLException(Exception):
	def __init__(self, value=None):
		self.value = value
		
	def __str__(self):
		return repr(self.value)

cdef public class Time[type Py_TimeType, object Py_TimeObject]:
	ZERO = wrap_time(<dsystem.Time*>&dsystem.time.Zero)

	cdef dsystem.Time *p_this

	def __init__(self):
		self.p_this = new dsystem.Time()

	def __dealloc__(self):
		del self.p_this

	def __repr__(self):
		return "sf.Time({0}s, {1}ms, {2}µs)".format(self.seconds, self.milliseconds, self.microseconds)
		
	def __str__(self):
		return "{0} milliseconds".format(self.milliseconds)

	def __richcmp__(Time x, Time y, int op):
		if op == 0:   return x.p_this[0] <  y.p_this[0]
		elif op == 2: return x.p_this[0] == y.p_this[0]
		elif op == 4: return x.p_this[0] >  y.p_this[0]
		elif op == 1: return x.p_this[0] <= y.p_this[0]
		elif op == 3: return x.p_this[0] != y.p_this[0]
		elif op == 5: return x.p_this[0] >= y.p_this[0]

	def __add__(Time x, Time y):
		cdef dsystem.Time* p = new dsystem.Time()
		p[0] = x.p_this[0] + y.p_this[0]
		return wrap_time(p)
		
	def __sub__(Time x, Time y):
		cdef dsystem.Time* p = new dsystem.Time()
		p[0] = x.p_this[0] - y.p_this[0]
		return wrap_time(p)
		
	def __iadd__(self, Time x):
		self.p_this[0] = self.p_this[0] + x.p_this[0]
		return self

	def __isub__(self, Time x):
		self.p_this[0] = self.p_this[0] - x.p_this[0]
		return self

	property seconds:
		def __get__(self):
			return self.p_this.asSeconds()

		def __set__(self, float seconds):
			self.p_this[0] = dsystem.seconds(seconds)

	property milliseconds:
		def __get__(self):
			return self.p_this.asMilliseconds()

		def __set__(self, Int32 milliseconds):
			self.p_this[0] = dsystem.milliseconds(milliseconds)

	property microseconds:
		def __get__(self):
			return self.p_this.asMicroseconds()

		def __set__(self, Int64 microseconds):
			self.p_this[0] = dsystem.microseconds(microseconds)

	def reset(self):
		self.milliseconds = 0

	def copy(self):
		cdef dsystem.Time* p = new dsystem.Time()
		p[0] = self.p_this[0]
		return wrap_time(p)

cdef Time wrap_time(dsystem.Time* p):
	cdef Time r = Time.__new__(Time)
	r.p_this = p
	return r

def sleep(Time duration):
	dsystem.sleep(duration.p_this[0])

cdef class Clock:
	cdef dsystem.Clock *p_this

	def __cinit__(self):
		self.p_this = new dsystem.Clock()

	def __dealloc__(self):
		del self.p_this

	def __repr__(self):
		return "sf.Clock({0})".format(self.elapsed_time)
		
	def __str__(self):
		return "{0}".format(self.elapsed_time)
		
	property elapsed_time:
		def __get__(self):
			cdef dsystem.Time* p = new dsystem.Time()
			p[0] = self.p_this.getElapsedTime()
			return wrap_time(p)

	def restart(self):
		cdef dsystem.Time* p = new dsystem.Time()
		p[0] = self.p_this.restart()
		return wrap_time(p)

def seconds(float amount):
	cdef dsystem.Time* p = new dsystem.Time()
	p[0] = dsystem.seconds(amount)
	return wrap_time(p)
	
def milliseconds(Int32 amount):
	cdef dsystem.Time* p = new dsystem.Time()
	p[0] = dsystem.milliseconds(amount)
	return wrap_time(p)
	
def microseconds(Int64 amount):
	cdef dsystem.Time* p = new dsystem.Time()
	p[0] = dsystem.microseconds(amount)
	return wrap_time(p)

cdef dsystem.FloatRect rectangle_to_floatrect(rectangle):
	l, t, w, h = rectangle
	return dsystem.FloatRect(l, t, w, h)
	
cdef dsystem.IntRect rectangle_to_intrect(rectangle):
	l, t, w, h = rectangle
	return dsystem.IntRect(l, t, w, h)

cdef dsystem.Vector2i position_to_vector2i(position):
	x, y = position
	return dsystem.Vector2i(x, y)
	
cdef dsystem.Vector2f position_to_vector2f(position):
	x, y = position
	return dsystem.Vector2f(x, y)

cdef dsystem.Vector2u size_to_vector2u(size):
	w, h = size
	return dsystem.Vector2u(w, h)
	
cdef dsystem.Vector2f size_to_vector2f(size):
	w, h = size
	return dsystem.Vector2f(w, h)

cdef object intrect_to_rectangle(dsystem.IntRect* intrect):
	return Rectangle((intrect.left, intrect.top), (intrect.width, intrect.height))

cdef object floatrect_to_rectangle(dsystem.FloatRect* floatrect):
	return Rectangle((floatrect.left, floatrect.top), (floatrect.width, floatrect.height))
