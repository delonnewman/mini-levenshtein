#include "ruby.h"
#include "levenshtein.h"

VALUE MiniLevenshteinInternal = Qnil;

VALUE method_internal_distance(VALUE self, VALUE s1, VALUE s2, VALUE xcost);

void Init_mini_levenshtein()
{
  MiniLevenshteinInternal = rb_define_module("MiniLevenshteinInternal");
  rb_define_method(MiniLevenshteinInternal, "internal_distance", method_internal_distance, 3);
}

VALUE method_internal_distance(VALUE self, VALUE s1, VALUE s2, VALUE xcost)
{
  size_t len1 = RSTRING_LEN(s1);
  size_t len2 = RSTRING_LEN(s2);

  const lev_byte *str1 = StringValuePtr(s1);
  const lev_byte *str2 = StringValuePtr(s2);

  int cost = FIX2INT(xcost);

  long distance = lev_edit_distance(len1, str1, len2, str2, cost);

  return INT2NUM(distance);
}
