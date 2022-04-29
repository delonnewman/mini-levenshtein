# frozen_string_literal: true

# Loads mkmf which is used to make makefiles for Ruby extensions
require "mkmf"

# The destination
dir_config("mini-levenshtein/mini_levenshtein")

# Do the work
create_makefile("mini-levenshtein/mini_levenshtein")
