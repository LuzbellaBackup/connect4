# frozen_string_literal: true

# /jk: small set of functions to make my life easier
# /srs: Math functions commonly used for game's logic
module MathFun
  # module of N /limit + revolution value
  def mod_postN(num, limit, rev = 0)
    num > limit ? (num % limit) + (rev * limit) : 0
  end

  # transform iteration for arrays
  def arrI(iteration)
    iteration - 1
  end

  def y_loop_fix(iteration, base, height, revolution)
    (arrI iteration - base) - mod_postN(iteration, height, revolution)
  end

  def x_loop_fix(iteration, base, height, revolution)
    base + mod_postN(iteration, height, revolution)
  end

  # checks if the current values are worth
  def evaluation(iteration, base, height, revolution)
    y_diag_fix(iteration, base, height, revolution) >= 0 && x_diag_fix(iteration, base, height, revolution) < 7
  end
end

# A lot of this math was planned **on paper** before starting to code any part of C4
# the idea was to get a reliable, lightweight and fast way to transverse a group of
# matrixes n*m. which accidentally ended up setting the groundworks for a convolution.
#
# the easiest representation is a cordinates set ( k-j , j ) where j slowly progresses
# up to n+m and which results outside of the defined range [0, n] are clamped out of
# the system. this gives a pretty output where the cordinate set are all the possible
# summation k+j that would equal the current iteration.
#
# Examples
# 0 -> 0,0
# 1 -> 1,0 : 0,1
# 2 -> 2,0 : 1,1 : 0,2
# 3 -> 3,0 : 2,1 : 1,2 : 0,3
# ...
# i -> Series from 0 to i: { k(i) - j(i) , j(i) }
