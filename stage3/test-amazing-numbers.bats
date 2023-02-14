#!/usr/bin/env bats
load bats-extra

@test 'One is an odd number' {
  # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
  run gawk -f amazing-numbers.awk <<< 1
  assert_success
  assert_output --partial 'Properties of 1'
  assert_output --partial 'even: false'
  assert_output --partial 'odd: true'
  assert_output --partial 'buzz: false'
  assert_output --partial 'duck: false'
  assert_output --partial 'palindromic: true'
}

@test 'Two is an even number' {
  run gawk -f amazing-numbers.awk <<< 2
  assert_success
  assert_output --partial 'Properties of 2'
  assert_output --partial 'even: true'
  assert_output --partial 'odd: false'
  assert_output --partial 'buzz: false'
  assert_output --partial 'duck: false'
}

@test 'Negative numbers are not natural' {
  run gawk -f amazing-numbers.awk <<< -1
  assert_failure
  assert_output --partial "number is not natural"
}

@test 'Seven is a buzz, odd number' {
  run gawk -f amazing-numbers.awk <<< 7
  assert_success
  assert_output --partial 'Properties of 7'
  assert_output --partial 'even: false'
  assert_output --partial 'odd: true'
  assert_output --partial 'buzz: true'
  assert_output --partial 'duck: false'
}

@test 'Properties of 101' {
  run gawk -f amazing-numbers.awk <<< 101
  assert_success
  assert_output --partial 'Properties of 101'
  assert_output --partial 'even: false'
  assert_output --partial 'odd: true'
  assert_output --partial 'buzz: false'
  assert_output --partial 'duck: true'
  assert_output --partial 'palindromic: true'
}
