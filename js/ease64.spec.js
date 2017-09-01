var Ease64 = require('./ease64')

describe('Ease64 encoding', function () {
  it('encodes one char', function () {
    var ease64 = new Ease64()
    expect(ease64.encode64('A')).toBe('HH')
  })
})
