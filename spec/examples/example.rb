# frozen_string_literal: true

# following DRY i decided to take all mock values to their own external module
module MockValues
  EXTREME_CASES = {
    empty:
    [
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil]
    ],
    complete:
    [
      %w[a b a b a b],
      %w[a b a b a b],
      %w[a b a b a b],
      %w[b a b a b a],
      %w[a b a b a b],
      %w[a b a b a b],
      %w[a b a b a b]
    ],
    default:
    [
      %w[a a b a b a],
      ['b', 'b', nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['b', 'b', nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['b', 'b', nil, nil, nil, nil],
      ['b', nil, nil, nil, nil, nil]
    ],
    default2:
    [
      ['b', 'b', nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['b', 'b', nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      %w[a a b a b a],
      ['b', 'b', nil, nil, nil, nil],
      ['a', nil, nil, nil, nil, nil]
    ]
  }.freeze

  WIN_CONDITIONS = {
    white_valid:
    [
      ['a', 'a', 'a', 'a', nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['a', nil, nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', nil, nil, 'a', nil, nil]
    ],
    white_invalid:
    [
      ['b', 'a', 'a', 'a', nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['b', nil, nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', nil, nil, 'a', nil, nil]
    ],
    black_valid:
    [
      ['b', 'b', 'b', 'b', nil, nil],
      ['b', nil, 'b', nil, nil, nil],
      ['b', 'b', nil, nil, nil, nil],
      ['b', nil, nil, nil, nil, nil],
      ['b', 'b', nil, nil, nil, nil],
      ['b', nil, 'b', nil, nil, nil],
      ['b', nil, nil, 'b', nil, nil]
    ],
    black_invalid:
    [
      ['b', 'a', 'a', 'a', nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['b', nil, nil, nil, nil, nil],
      ['a', 'a', nil, nil, nil, nil],
      ['a', nil, 'a', nil, nil, nil],
      ['a', nil, nil, 'a', nil, nil]
    ]
  }.freeze
end
