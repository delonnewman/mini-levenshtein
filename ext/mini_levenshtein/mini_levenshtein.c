#include <ruby.h>
#include "extconf.h"

#include "levenshtein.h"

VALUE MiniLevenshtein = Qnil;

VALUE rb_lev_edit_distance(VALUE self, VALUE s1, VALUE s2, VALUE xcost);
VALUE rb_edit_distance(VALUE self, VALUE s1, VALUE s2);
VALUE rb_similarity(VALUE self, VALUE s1, VALUE s2);

void Init_mini_levenshtein()
{
  MiniLevenshtein = rb_define_module("MiniLevenshtein");
  rb_define_singleton_method(MiniLevenshtein, "lev_edit_distance", rb_lev_edit_distance, 3);
  rb_define_singleton_method(MiniLevenshtein, "edit_distance", rb_edit_distance, 2);
  rb_define_singleton_method(MiniLevenshtein, "similarity", rb_similarity, 2);
}

VALUE rb_lev_edit_distance(VALUE self, VALUE s1, VALUE s2, VALUE xcost)
{
  Check_Type(s1, T_STRING);
  Check_Type(s2, T_STRING);
  Check_Type(xcost, T_FIXNUM);
  
  size_t len1 = RSTRING_LEN(s1);
  size_t len2 = RSTRING_LEN(s2);

  const lev_byte *str1 = StringValuePtr(s1);
  const lev_byte *str2 = StringValuePtr(s2);

  int cost = FIX2INT(xcost);

  long distance = lev_edit_distance(len1, str1, len2, str2, cost);

  return INT2NUM(distance);
}

VALUE rb_edit_distance(VALUE self, VALUE s1, VALUE s2)
{
  Check_Type(s1, T_STRING);
  Check_Type(s2, T_STRING);
  
  size_t len1 = RSTRING_LEN(s1);
  size_t len2 = RSTRING_LEN(s2);

  const lev_byte *str1 = StringValuePtr(s1);
  const lev_byte *str2 = StringValuePtr(s2);

  long distance = lev_edit_distance(len1, str1, len2, str2, 0);

  return INT2NUM(distance);
}

VALUE rb_similarity(VALUE self, VALUE s1, VALUE s2)
{
  Check_Type(s1, T_STRING);
  Check_Type(s2, T_STRING);
  
  size_t len1 = RSTRING_LEN(s1);
  size_t len2 = RSTRING_LEN(s2);

  const lev_byte *str1 = StringValuePtr(s1);
  const lev_byte *str2 = StringValuePtr(s2);

  size_t lensum = len1 + len2;
  if (lensum == 0) {
    return DBL2NUM(1.0);
  }
  
  long distance = lev_edit_distance(len1, str1, len2, str2, 0);
  if (distance == 0) {
    return DBL2NUM(1.0);
  }

  return DBL2NUM((lensum - distance) / (double)lensum);
}
