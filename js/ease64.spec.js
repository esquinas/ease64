var Ease64 = require('./ease64')

describe('Ease64 encoding', function () {
  it('encodes one char', function () {
    var ease64 = Object.create(Ease64)
    expect(ease64.encode64('A')).toBe('HH')
  })
})

describe('Ease64 decoding', function () {
  it('encodes one char', function () {
    var ease64 = Object.create(Ease64)
    expect(ease64.decode64('HH')).toBe('A')
  })
})
